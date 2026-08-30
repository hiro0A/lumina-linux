# Lumina Linux

Lumina Linux é uma imagem pessoal baseada no Bazzite KDE para desenvolvimento,
uso diário e jogos em um notebook AMD Ryzen 7 7735HS. A imagem mantém Steam,
Proton, Mesa, atualizações atômicas e reversão do Bazzite, acrescentando uma
organização própria do KDE Plasma inspirada na praticidade do macOS.

O projeto usa somente componentes livres ou distribuídos pelos seus canais
oficiais. Nenhum ícone, fonte, logotipo ou papel de parede da Apple é incluído.

## O que já está configurado

- KDE Plasma 6 com tema escuro Breeze.
- Botões fechar, minimizar e maximizar no lado esquerdo das janelas.
- Barra superior com menu global, área de indicadores, data e hora.
- Dock flutuante centralizado com Dolphin, Chrome, PyCharm, Konsole, Steam,
  Configurações, Lixeira e Mostrar área de trabalho.
- Papel de parede original Lumina Waves em proporção 16:9.
- Steam, Proton e drivers AMD Mesa fornecidos pela imagem oficial do Bazzite.
- zram de até 8 GB para o notebook com memória limitada.
- Instalação automática, por usuário, de Chrome, PyCharm, Flatseal, Bottles e
  Heroic no primeiro login com internet.

Se a internet não estiver disponível no primeiro login, a instalação dos
aplicativos será tentada novamente no próximo. Também pode ser iniciada
manualmente com `lumina-first-setup`.

## Construção da imagem

O repositório segue o modelo oficial `ublue-os/image-template`.

1. Crie um repositório público chamado `lumina-linux` na conta `hiro0A`.
2. Gere um par de chaves Cosign e salve a chave privada no segredo de Actions
   chamado `SIGNING_SECRET`. Publique somente `cosign.pub` no repositório.
3. Envie estes arquivos para a ramificação `main` e habilite GitHub Actions.
4. Aguarde o fluxo `Build container image` publicar
   `ghcr.io/hiro0a/lumina-linux:latest`.
5. Execute manualmente `Build disk images`, escolhendo `amd64`.
6. Baixe o artefato que contém `bootiso/install.iso`.

O arquivo ISO gerado nessa última etapa é a mídia Lumina personalizada. A ISO
oficial do Bazzite que está atualmente no pendrive não contém estas mudanças.

## Instalação em dual boot

Leia [docs/DUAL_BOOT.md](docs/DUAL_BOOT.md) antes de alterar o disco. O plano
atual reserva 100 GB não alocados para o Linux, preserva a partição EFI sem
formatá-la e mantém o Windows para jogos incompatíveis com Linux, como os que
usam antitrapaça em nível de kernel.

Nunca selecione o disco inteiro no instalador. Confira visualmente a unidade e
as partições antes de confirmar qualquer gravação.

## Referências do projeto

- `docs/lumina-interface-mac-concept-v2.png`: conceito visual aprovado.
- `docs/AMD-MIGRATION.md`: equivalências das configurações AMD no Linux.
- `windows/collect-preinstall.ps1`: coleta somente leitura para revisar o disco
  antes da instalação.

## Estado

O repositório está preparado para publicação e construção na conta `hiro0A`.
A ISO final só existirá depois que o contêiner e o instalador forem construídos
com sucesso pelo GitHub Actions.
