# Lise Cozinha: passo a passo

## 1) Supabase (o banco de dados)
1. Crie uma conta gratuita em supabase.com e um projeto novo (guarde a senha do banco).
2. Menu **SQL Editor** > New query > cole o conteúdo de `schema.sql` > **Run**.
3. Menu **Authentication > Users > Add user**: crie uma conta (e-mail + senha) para cada usuária. Marque "Auto Confirm User".
4. IMPORTANTE: em **Authentication > Sign In / Providers** (ou Settings), DESLIGUE a opção de permitir novos cadastros (Allow new users to sign up). Sem isso, qualquer pessoa que conheça o endereço do site poderia criar conta e ver os dados.
5. Em **Project Settings > API** copie a **Project URL** e a chave pública (anon / publishable). NUNCA use a chave secreta (service_role).

## 2) Configurar o arquivo
Abra `config.js` em um editor de texto (Bloco de Notas serve) e cole, ENTRE AS ASPAS:
- `SUPABASE_URL`: a Project URL (https://....supabase.co, sem nada depois)
- `SUPABASE_KEY`: a chave pública (sb_publishable_...)
Só o `config.js` precisa ser editado. Se algo der errado, o site mostra o erro na tela.

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

## Questionário de preferências (novo)
1. No Supabase, abra o SQL Editor e rode o `schema.sql` de novo (ele cria a tabela `respostas` sem apagar nada do que já existe).
2. Suba o `questionario.html` para o GitHub junto com os outros arquivos. O link para os clientes é `seusite.pages.dev/questionario.html` (também aparece no menu Preferências do aplicativo).
3. As respostas aparecem em **Preferências** no menu, com aviso de novas, PDF, CSV para planilha e botão para salvar no cadastro do cliente.
4. Opcional: coloque o WhatsApp da Lise na linha `const WHATS=''` do `questionario.html` (55 + DDD + número).
