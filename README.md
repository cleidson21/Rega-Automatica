# Sistema Automatizado de Irrigação Residencial
## Descrição do Projeto

O projeto desenvolvido como parte do componente curricular TEC 498 MI - Projeto de Circuito Digitais, utilizando da metodologia Problem Based Learning (PBL). 
O sistema foi desenvolvido utilizando linguagem de descrição de hardware verilog e testada em um  Kit de desenvolvimento LEDS-CPLD.

## Equipe
- [Cleidson Ramos de Carvalho](https://github.com/cleidson21)
- [Pedro Henrique Vieira Cruz](https://github.com/pedroc07)
- [Pedro Henrique Santos](https://github.com/Esqueletolegal95)

### Características do Sistema: 

- Três sensores de nível d’água, Alto (H), Médio (M), Baixo (L). 
- Por meio dos sensores de nível, o sistema deve decidir se aciona ou não a irrigação ou a entrada de água para a caixa d'água.
- O sistema de irrigação conta com sensores de umidade no Solo, umidade do ar e Temperatura que monitoram as condições no Jardim.
- Por meio dos sensores do ambiente, o sistema deve seleciona o melhor tipo de irrigação.
 

### Requisitos de Projeto:

- Valores conflitantes entre os sensores de nível resultam em erros de medição;
- A caixa d’água é alimentada por uma válvula na entrada (VE) que é acionada eletricamente. Ela deve ser fechada somente se a caixa atingir o nível máximo, ou quando acontecer um erro de medição de nível;
- Um alarme (AL) deve ser acionado sempre que exista erro nos sensores de nível Ele também será acionado quando o nível mínimo for atingido;
- Quando houver um erro na medição do nível, todos os acionamentos devem ser desligados;
- Se o nível de água da caixa estiver abaixo do mínimo, todos os acionamentos de saída devem ser desligados e o sinal de alarme (AL) acionado. Neste caso o acionamento de alimentação da caixa d’água (VE) permanece ligado.
- Quando o solo estiver seco e a umidade do ar baixa, o sistema de aspersão (Bs) de deve ser acionado;
- Quando o solo estiver seco, a umidade do ar alta, e a temperatura baixa, o sistema por gotejamento (Vs) deve ser acionado;
- Quando o solo estiver seco, a umidade do ar alta, e a temperatura alta, o sistema por gotejamento (Vs) deve ser acionado se o nível de água estiver abaixo do médio e maior que o mínimo. Caso contrário, nível maior ou igual ao médio, o sistema de aspersão (Bs) deve ser acionado.
- Quando o solo estiver úmido, as saídas de aspersão e por gotejamento devem ser desligadas.
- Um dos dígitos do mostrador de 7 segmentos deve ser usado com saída para informar o nível da caixa d’água (alto, médio ou baixo), ou tipo de rega que está em andamento. O usuário define o que será visualizado.
