/*
APRESENTAÇÃO DO PROJETO WoRMS (World Register of Marine Species):
O banco de dados WoRMS (World Register of Marine Species) visa centralizar e organizar informações sobre espécies marinhas, sua classificação taxonômica e distribuição geográfica. Esse banco facilita o acesso e a atualização dos dados por pesquisadores e conservacionistas, oferecendo dados cruciais para estudos ambientais e preservação de ecossistemas marinhos.
SITE OFICIAL: http://www.marinespecies.org

PROBLEMÁTICA PARA A CONSTRUÇÃO DO BANCO DE DADOS WoRMS:
O principal desafio na construção do WoRMS é garantir a atualização constante e precisa das informações taxonômicas, devido às frequentes reclassificações e descobertas de novas espécies. Além disso, o banco precisa ser escalável para lidar com grandes volumes de dados, mantendo a performance e a integridade das informações. A inclusão de imagens externas também representa um desafio de manutenção, uma vez que os links podem se tornar inválidos ao longo do tempo.
*/

// Criar BD WoRMS (World Register of Marine Species)
use worms;

// Criar collections
db.createCollection("species"); // Espécies com informações básicas (nome, autor, status de aceitação no BD, imagem)
db.createCollection("taxonomy"); // Classificação taxonômica das espécies (reino, filo, classe, ordem)
db.createCollection("distribution"); // Distribuição geográfica das espécies (região de ocorrência)

// Inserção de espécies
db.species.insertMany([
    {
        "species_name": "Goniopora lobata",
        "author": "Lamarck, 1816",
        "status": "accepted",
        "image": "urlImagemEspecieFotografada",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Acropora cervicornis",
        "author": "Lamarck, 1816",
        "status": "accepted",
        "image": "urlImagemEspecieFotografada",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Pocillopora damicornis",
        "author": "Linnaeus, 1758",
        "status": "accepted",
        "image": "urlImagemEspecieFotografada",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Stylophora pistillata",
        "author": "Esper, 1795",
        "status": "accepted",
        "image": "urlImagemEspecieFotografada",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Montipora digitata",
        "author": "Dana, 1846",
        "status": "accepted",
        "image": "urlImagemEspecieFotografada",
        "createdAt": new Date(),
        "updatedAt": new Date()
    }
]);

// Inserção de classificações taxonômicas
db.taxonomy.insertMany([
    {
        "species_name": "Goniopora lobata",
        "kingdom": "Animalia",
        "phylum": "Cnidaria",
        "class": "Anthozoa",
        "order": "Scleractinia",
        "image": "urlImagemOficialEspecie",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Acropora cervicornis",
        "kingdom": "Animalia",
        "phylum": "Cnidaria",
        "class": "Anthozoa",
        "order": "Scleractinia",
        "image": "urlImagemOficialEspecie",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Pocillopora damicornis",
        "kingdom": "Animalia",
        "phylum": "Cnidaria",
        "class": "Anthozoa",
        "order": "Scleractinia",
        "image": "urlImagemOficialEspecie",
        "createdAt": new Date(),
        "updatedAt": new Date()
    }
]);

// Inserção de distribuições geográficas
db.distribution.insertMany([
    {
        "species_name": "Goniopora lobata",
        "region": "Indo-Pacific",
        "image": "urlImagemDistribuicaoGeografica",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Acropora cervicornis",
        "region": "Caribbean Sea",
        "image": "urlImagemDistribuicaoGeografica",
        "createdAt": new Date(),
        "updatedAt": new Date()
    },
    {
        "species_name": "Pocillopora damicornis",
        "region": "Pacific Ocean",
        "image": "urlImagemDistribuicaoGeografica",
        "createdAt": new Date(),
        "updatedAt": new Date()
    }
]);

// Consultas básicas - Exemplos de find e pretty
db.species.find().pretty();
db.taxonomy.find().pretty();
db.distribution.find().pretty();

// Consultar todas as espécies que foram classificadas com status "accepted" e que possuem imagens válidas
db.species.find({
    "status": "accepted",
    "image": { $exists: true, $ne: null }
}).pretty();

// Consultar todas as espécies do "phylum" "Cnidaria" que estão no "Scleractinia" como "order"
db.taxonomy.find({
    "phylum": "Cnidaria",
    "order": "Scleractinia"
}).pretty();

// Consultar espécies com imagem válida e com o autor "Lamarck"
db.species.find({
    "author": "Lamarck, 1816",
    "image": { $exists: true, $ne: null }
}).pretty();

// Consultar todas as espécies que possuem uma distribuição geográfica no "Indo-Pacific"
db.distribution.find({
    "region": "Indo-Pacific"
}).pretty();

// Consultar todas as espécies que possuem a classificação taxonômica no "Anthozoa" e estão no "Scleractinia"
db.taxonomy.find({
    "class": "Anthozoa",
    "order": "Scleractinia"
}).pretty();

// Consultar todas as distribuições geográficas atualizadas recentemente, considerando as últimas 48 horas
db.distribution.find({
    "updatedAt": { $gte: new Date(new Date().getTime() - 48*60*60*1000) }
}).pretty();

// Consultar todas as espécies que foram modificadas recentemente (últimas 24 horas)
db.species.find({
    "updatedAt": { $gte: new Date(new Date().getTime() - 24*60*60*1000) }
}).pretty();

// Consultar todas as espécies que possuem uma região geográfica no "Caribbean Sea" e são "accepted"
db.species.aggregate([
    {
        $lookup: {
            from: "distribution",
            localField: "species_name",
            foreignField: "species_name",
            as: "distribution_info"
        }
    },
    {
        $unwind: "$distribution_info"
    },
    {
        $match: {
            "status": "accepted",
            "distribution_info.region": "Caribbean Sea"
        }
    },
    {
        $project: {
            species_name: 1,
            author: 1,
            status: 1,
            distribution_info: 1
        }
    }
]).pretty();

// Consultar todas as espécies que possuem tanto o status "accepted" quanto "not accepted"
db.species.find({
    "status": { $in: ["accepted", "not accepted"] }
}).pretty();

// Consultar todas as espécies que têm o campo "updatedAt" com datas posteriores a uma data específica
db.species.find({
    "updatedAt": { $gte: new Date("2025-01-01T00:00:00Z") }
}).pretty();




// Atualizar o status de "Acropora cervicornis" para "not accepted"
db.species.updateOne(
    { "species_name": "Acropora cervicornis" },
    { $set: { "status": "not accepted", "updatedAt": new Date() } }
);
// Consultar todas as espécies com status "not accepted"
db.species.find({ "status": "not accepted" }).pretty();

// Atualizar a região de "Pocillopora damicornis" para "Red Sea"
db.distribution.updateOne(
    { "species_name": "Pocillopora damicornis" },
    { $set: { "region": "Red Sea", "updatedAt": new Date() } }
);
// Consultar espécies com a região "Red Sea"
db.distribution.find({ "region": "Red Sea" }).pretty();

// Atualizar várias espécies para adicionar uma nova imagem
db.species.updateMany(
    { "status": "accepted" },
    { $set: { "image": "https://www.floridamuseum.ufl.edu/wp-content/uploads/2018/05/goniopora-lobata-800px.jpg", "updatedAt": new Date() } }
);
// Consultar todas as espécies com nova imagem
db.species.find({ "image": "https://www.floridamuseum.ufl.edu/wp-content/uploads/2018/05/goniopora-lobata-800px.jpg" }).pretty();

// Atualizar a classificação taxonômica de uma espécie
db.taxonomy.updateOne(
    { "species_name": "Goniopora lobata" },
    { $set: { "order": "New Order", "updatedAt": new Date() } }
);
// Consultar espécies com "order" atualizado
db.taxonomy.find({ "order": "New Order" }).pretty();

// Atualizar a classificação de várias espécies para mudar o filo
db.taxonomy.updateMany(
    { "phylum": "Cnidaria" },
    { $set: { "phylum": "Updated Phylum", "updatedAt": new Date() } }
);
// Consultar todas as espécies no "Updated Phylum"
db.taxonomy.find({ "phylum": "Updated Phylum" }).pretty();





// Consultas avançadas após updates

// Consultar todas as distribuições geográficas com o campo "updatedAt" recente
db.distribution.find({ "updatedAt": { $gte: new Date(new Date().getTime() - 24*60*60*1000) } }).pretty();