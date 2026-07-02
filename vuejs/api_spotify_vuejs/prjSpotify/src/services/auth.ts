const CLIENT_ID = import.meta.env.VITE_SPOTIFY_CLIENT_ID;
const REDIRECT_URI = 'http://127.0.0.1:8100/callback';
const SCOPES = ['playlist-read-private', 'playlist-read-collaborative'];
const AUTH_ENDPOINT = 'https://accounts.spotify.com/authorize';
const TOKEN_ENDPOINT = 'https://accounts.spotify.com/api/token';

function generateCodeVerifier(): string {
    const array = new Uint8Array(64);
    crypto.getRandomValues(array);
    return btoa(String.fromCharCode(...array))
        .replace(/\+/g, '-')
        .replace(/\//g, '_')
        .replace(/=+$/, '');
}

async function generateCodeChallenge(verifier: string): Promise<string> {
    const data = new TextEncoder().encode(verifier);
    const digest = await crypto.subtle.digest('SHA-256', data);
    const base64 = btoa(String.fromCharCode(...new Uint8Array(digest)));
    return base64.replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

export async function redirectToSpotifyLogin() {
    const verifier = generateCodeVerifier();
    const challenge = await generateCodeChallenge(verifier);

    const params = new URLSearchParams({
        response_type: 'code',
        client_id: CLIENT_ID,
        scope: SCOPES.join(' '),
        redirect_uri: REDIRECT_URI,
        code_challenge_method: 'S256',
        code_challenge: challenge,
        state: verifier
    });

    window.location.href = `${AUTH_ENDPOINT}?${params.toString()}`;
}

export async function fetchAccessToken(code: string, verifier: string): Promise<string> {
    const body = new URLSearchParams({
        grant_type: 'authorization_code',
        code,
        redirect_uri: REDIRECT_URI,
        client_id: CLIENT_ID,
        code_verifier: verifier
    });

    console.log('Enviando requisição para token com corpo:', Object.fromEntries(body.entries()));

    const response = await fetch(TOKEN_ENDPOINT, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body
    });

    const data = await response.json();
    console.log('Resposta do token:', data);

    if (!response.ok) {
        throw new Error(`Erro ao obter token: ${response.status} - ${JSON.stringify(data)}`);
    }

    if (!data.access_token) {
        throw new Error('access_token ausente na resposta');
    }

    localStorage.setItem('access_token', data.access_token);
    return data.access_token;
}

export function getAccessToken(): string | null {
    return localStorage.getItem('access_token');
}

export function logout() {
    localStorage.removeItem('access_token');
}