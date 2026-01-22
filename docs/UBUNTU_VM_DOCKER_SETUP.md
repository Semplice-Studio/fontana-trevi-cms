# Setup Docker su Ubuntu VM

Quando si configura una nuova VM Ubuntu per il deploy, è necessario installare Docker con il plugin Compose V2 dai repository ufficiali Docker.

## Problema

I repository Ubuntu di default installano una versione di Docker senza il plugin `docker compose`. Il Makefile di questo progetto usa la sintassi V2 (`docker compose` senza trattino), quindi l'installazione standard di Ubuntu non funzionerà.

Errore tipico:
```
docker compose up -d --build
unknown shorthand flag: 'd' in -d
```

## Soluzione

### 1. Installa le dipendenze

```bash
sudo apt update
sudo apt install ca-certificates curl gnupg
```

### 2. Aggiungi la chiave GPG di Docker

```bash
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

### 3. Aggiungi il repository ufficiale Docker

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### 4. Installa Docker Compose plugin

```bash
sudo apt update
sudo apt install docker-compose-plugin
```

### 5. Verifica l'installazione

```bash
docker compose version
```

Dovresti vedere qualcosa come:
```
Docker Compose version v2.x.x
```

## Installazione completa di Docker (opzionale)

Se Docker non è ancora installato sulla VM, puoi installare tutto insieme:

```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Note

- Questi passaggi sono stati testati su Ubuntu 22.04 LTS e 24.04 LTS
- Dopo l'installazione, potrebbe essere necessario aggiungere l'utente al gruppo docker:
  ```bash
  sudo usermod -aG docker $USER
  ```
  Effettua logout e login per applicare le modifiche.
