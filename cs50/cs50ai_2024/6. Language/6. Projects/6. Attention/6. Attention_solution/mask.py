# Importa bibliotecas necessárias
import sys
import tensorflow as tf
from PIL import Image, ImageDraw, ImageFont
from transformers import AutoTokenizer, TFBertForMaskedLM

# Nome do modelo pré-treinado do tipo masked language model (BERT uncased)
MODEL = "bert-base-uncased"

# Número de palavras para prever no lugar do token [MASK]
K = 3

# Constantes visuais para desenhar os mapas de atenção
FONT = ImageFont.truetype("assets/fonts/OpenSans-Regular.ttf",
                          28)  # Fonte para os textos nas imagens
GRID_SIZE = 40  # Tamanho de cada célula da matriz de atenção
PIXELS_PER_WORD = 200  # Espaço reservado para cada palavra na imagem


def main():
    # Solicita entrada do usuário com token [MASK]
    text = input("Text: ")

    # Tokeniza a entrada e retorna tensores do TensorFlow
    tokenizer = AutoTokenizer.from_pretrained(MODEL)
    inputs = tokenizer(text, return_tensors="tf")

    # Identifica a posição do token [MASK]
    mask_token_index = get_mask_token_index(tokenizer.mask_token_id, inputs)
    if mask_token_index is None:
        sys.exit(f"Input must include mask token {tokenizer.mask_token}.")

    # Carrega o modelo BERT pré-treinado com saída de atenções
    model = TFBertForMaskedLM.from_pretrained(MODEL)
    result = model(**inputs, output_attentions=True)

    # Obtém os logits do token [MASK] e seleciona os K melhores candidatos
    mask_token_logits = result.logits[0, mask_token_index]
    top_tokens = tf.math.top_k(mask_token_logits, K).indices.numpy()

    # Imprime frases com os possíveis preenchimentos do token [MASK]
    for token in top_tokens:
        print(text.replace(tokenizer.mask_token, tokenizer.decode([token])))

    # Visualiza as atenções do modelo (todas as camadas e cabeças)
    visualize_attentions(inputs.tokens(), result.attentions)


def get_mask_token_index(mask_token_id, inputs):
    """
    Retorna o índice do token [MASK] no tensor de entrada.
    """
    input_ids = inputs["input_ids"][0].numpy()
    for i, token_id in enumerate(input_ids):
        if token_id == mask_token_id:
            return i
    return None


def get_color_for_attention_score(attention_score):
    """
    Converte um valor de atenção (entre 0 e 1) em um tom de cinza.
    Quanto maior o score, mais claro (branco) será o quadrado.
    """
    shade = int(attention_score * 255)
    return (shade, shade, shade)


def visualize_attentions(tokens, attentions):
    """
    Itera por todas as camadas e cabeças do modelo e gera diagramas de atenção.
    """
    num_layers = len(attentions)
    for layer_index in range(num_layers):
        num_heads = attentions[layer_index].shape[1]
        for head_index in range(num_heads):
            attention_weights = attentions[layer_index][0][head_index].numpy()
            generate_diagram(
                layer_index + 1,  # Index de camada começa em 1 para nomear arquivos
                head_index + 1,   # Idem para a cabeça
                tokens,
                attention_weights
            )


def generate_diagram(layer_number, head_number, tokens, attention_weights):
    """
    Cria uma imagem PNG representando a matriz de atenção de uma cabeça.
    """
    image_size = GRID_SIZE * len(tokens) + PIXELS_PER_WORD
    img = Image.new("RGBA", (image_size, image_size), "black")
    draw = ImageDraw.Draw(img)

    for i, token in enumerate(tokens):
        # Desenha o token rotacionado (colunas)
        token_image = Image.new("RGBA", (image_size, image_size), (0, 0, 0, 0))
        token_draw = ImageDraw.Draw(token_image)
        token_draw.text(
            (image_size - PIXELS_PER_WORD, PIXELS_PER_WORD + i * GRID_SIZE),
            token,
            fill="white",
            font=FONT
        )
        token_image = token_image.rotate(90)
        img.paste(token_image, mask=token_image)

        # Desenha o token na vertical (linhas)
        _, _, width, _ = draw.textbbox((0, 0), token, font=FONT)
        draw.text(
            (PIXELS_PER_WORD - width, PIXELS_PER_WORD + i * GRID_SIZE),
            token,
            fill="white",
            font=FONT
        )

    # Desenha os quadrados da matriz de atenção (intensidade baseada no score)
    for i in range(len(tokens)):
        y = PIXELS_PER_WORD + i * GRID_SIZE
        for j in range(len(tokens)):
            x = PIXELS_PER_WORD + j * GRID_SIZE
            color = get_color_for_attention_score(attention_weights[i][j])
            draw.rectangle((x, y, x + GRID_SIZE, y + GRID_SIZE), fill=color)

    # Salva a imagem com nome indicando camada e cabeça
    img.save(f"Attention_Layer{layer_number}_Head{head_number}.png")


# Executa o script se for chamado diretamente
if __name__ == "__main__":
    main()
