# ruby-dev-test-1

Desenvolver a camada de modelos de um sistema de arquivos persistido em um banco de dados SQL onde seja possível criar diretórios e arquivos. Os diretórios poderão conter sub-diretórios e arquivos. O conteúdo dos arquivos podem estar ser persistidos como blob, S3 ou mesmo em disco.

A soluçãos deverá ser escrita majoritariamente em Ruby com framework Ruby on Rails.

Realizar um fork deste repositório e abrir o PR ao finalizar.

------------

Levantando containers
```bash
docker compose up --build
```


Execute os comandos rails dentro do container web. Ex.:

```bash
docker compose exec web bundle exec rails db:create
docker compose exec web bundle exec rails db:migrate
```

Considere criar um aliases temporario

```bash
alias rails='docker compose exec web bundle exec rails'
alias bundle='docker compose exec web bundle'
```
