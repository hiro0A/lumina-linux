# Plano de dual boot

## Estado conhecido

- CPU: AMD Ryzen 7 7735HS, 16 processadores lógicos.
- GPU: AMD Radeon integrada, usando o driver Mesa no Linux.
- Firmware: UEFI.
- RAM: 8 GB instalados, com aproximadamente 5,7 GB utilizáveis pelo sistema
  porque cerca de 2 GB estão reservados para a GPU integrada. Expansão para
  16 ou 32 GB é fortemente recomendada.
- Disco único: Samsung MZAMX512HCLV-00BL2, 512 GB nominais, saudável, GPT.
- Partição EFI: 200 MB, FAT32.
- Partição Windows C: aproximadamente 476 GB. A coleta antiga registrou 293 GB
  livres; em 29/08/2026 a conferência do Windows mostrou cerca de 198 GB livres.
- Partição de recuperação: aproximadamente 856 MB.
- Firmware UEFI, Secure Boot desativado e BitLocker desativado.
- A coleta antiga informou tamanho mínimo suportado de 255,35 GB para C e
  redução máxima suportada de 220,54 GB. Esse limite deve ser medido novamente.

## Antes de redimensionar qualquer partição

1. Criar backup completo dos arquivos pessoais em outra unidade.
2. Criar uma mídia de recuperação do Windows.
3. Confirmar que a sincronização do Chrome terminou.
4. Registrar a chave de recuperação do BitLocker, se ele estiver habilitado.
5. Desativar a Inicialização Rápida do Windows.
6. Verificar o sistema de arquivos do Windows.
7. Produzir e revisar o mapa completo de discos e partições.

## Estratégia proposta

- Manter o Windows para eFootball e outros jogos com antitrapaça incompatível.
- Reservar inicialmente 100 GB para o Linux. Essa recomendação substitui o
  plano antigo de 140 GB porque o uso atual do Windows aumentou.
- Fazer uma nova coleta imediatamente antes do redimensionamento e confirmar
  que o Windows ainda permite a redução de 100 GB.
- Não criar nem remover partições até a revisão do mapa de discos.
- Instalar em UEFI, preservando a partição EFI existente.
- Testar Wi-Fi, Bluetooth, áudio, suspensão, monitor, Chrome e ferramentas de
  desenvolvimento antes de considerar qualquer remoção do Windows.

## Layout aprovado para a etapa de instalação

- Partição EFI existente: preservar integralmente; não formatar.
- Partição reservada Microsoft: preservar integralmente.
- Windows C: reduzir em 100 GB somente depois do backup e da nova conferência.
- Espaço não alocado: 100 GB, destinado ao instalador do Lumina Linux.
- Partição de recuperação do Windows: preservar integralmente.

O espaço deve permanecer **não alocado** no Windows. Não criar uma partição
NTFS para o Linux. A criação do sistema de arquivos será feita pelo instalador
depois de conferir visualmente todos os destinos.
