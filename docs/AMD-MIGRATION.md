# Migração das configurações AMD

O AMD Software: Adrenalin Edition é específico do Windows. Suas configurações
não podem ser importadas literalmente pelo Linux.

Equivalências planejadas:

- FreeSync/Adaptive Sync: KDE Plasma + Mesa, se o monitor declarar suporte.
- VSync e tearing: compositor KWin/Wayland e opções por jogo.
- Escala e resolução: KScreen no KDE Plasma.
- Limite de FPS: Gamescope ou opções do jogo.
- Perfil de energia: power-profiles-daemon e ferramentas fornecidas pelo Bazzite.
- Shader cache e Vulkan: Mesa/RADV.
- Métricas: MangoHud.

Antes da instalação, registrar manualmente no Adrenalin as opções atualmente
ativadas e capturar telas dos perfis por jogo. Nenhum ajuste de overclock,
undervolt ou limite térmico será recriado sem validação específica do hardware.

