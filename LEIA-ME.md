# Lise Cozinha: passo a passo

## 1) Supabase (o banco de dados)
1. Crie uma conta gratuita em supabase.com e um projeto novo (guarde a senha do banco).
2. Menu **SQL Editor** > New query > cole o conteúdo de `schema.sql` > **Run**.
3. Menu **Authentication > Users > Add user**: crie uma conta (e-mail + senha) para cada usuária. Marque "Auto Confirm User".
4. IMPORTANTE: em **Authentication > Sign In / Providers** (ou Settings), DESLIGUE a opção de permitir novos cadastros (Allow new users to sign up). Sem isso, qualquer pessoa que conheça o endereço do site poderia criar conta e ver os dados.
5. Em **Project Settings > API** copie a **Project URL** e a chave pública (anon / publishable). NUNCA use a chave secreta (service_role).

## 2) Configurar o arquivo
Abra `index.html` em um editor de texto (Bloco de Notas serve) e troque, no começo do script, as duas linhas:
- `SUPABASE_URL` pela Project URL
- `SUPABASE_KEY` pela chave pública

## 3) Cloudflare Pages (publicar)
1. Em dash.cloudflare.com: **Workers & Pages > Create > Pages > Upload assets**.
2. Dê um nome ao projeto e envie esta pasta inteira (ou o zip).
3. Abra o endereço gerado (algo como nome.pages.dev) e entre com o e-mail e a senha criados no passo 3 do Supabase.

## 4) Instalar no celular
- Android (Chrome): menu ⋮ > Instalar app / Adicionar à tela inicial.
- iPhone (Safari): botão Compartilhar > Adicionar à Tela de Início.

## Observações
- Na primeira abertura as 18 marmitas já vêm cadastradas, sem preço. Preencha em Cozinha > Marmitas > Preço e lucro.
- Cada tela salva sozinha; o selo no topo mostra "Salvo ✓".
- Se alguém editar a mesma coisa nos dois celulares ao mesmo tempo, vale a última gravação.
- Projetos gratuitos do Supabase podem ser pausados após um período sem uso; se acontecer, é só reativar no painel.
- Para atualizar o sistema no futuro, envie os arquivos novos pelo mesmo projeto do Cloudflare.
