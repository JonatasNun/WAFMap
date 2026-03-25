# WAFMap

## 📌 Descrição

**WAFMap** é uma ferramenta desenvolvida em **Bash** para identificação de possíveis proteções **WAF (Web Application Firewall)** em aplicações web por meio da análise de informações de infraestrutura associadas ao endereço IP do domínio analisado.

A ferramenta realiza a resolução do domínio para IP e verifica indícios de provedores de proteção conhecidos com base na organização responsável pela infraestrutura.

---

## 🚀 Funcionalidades

Atualmente, o WAFMap permite:

* análise de um domínio individual
* análise em lote a partir de uma lista de domínios
* resolução automática de domínio para endereço IP
* identificação de possíveis provedores de WAF
* execução simples via terminal Linux

---

## 🛡️ Provedores detectados (versão atual)

A versão atual identifica possíveis proteções associadas a:

* Cloudflare
* Akamai
* Imperva
* Fastly
* AWS
* Sucuri
* StackPath

Novos provedores poderão ser adicionados futuramente.

---

## 🔧 Requisitos

A ferramenta utiliza utilitários padrão disponíveis em sistemas Linux:

* bash
* host
* whois
* awk
* grep

Certifique-se de que estejam instalados antes da execução.

---

## ▶️ Como usar

### Analisar um único domínio

```bash
./resolver dominio.com
```

### Analisar uma lista de domínios

```bash
./resolver -l lista.txt
```

Arquivo de exemplo (`lista.txt`):

```
site1.com
site2.com
site3.com
```

---

## ⚙️ Como funciona

O WAFMap:

1. resolve o domínio para endereço IP
2. identifica informações de infraestrutura associadas ao IP
3. verifica correspondência com organizações conhecidas por fornecer proteção WAF
4. exibe o possível provedor detectado

---

## 🎯 Objetivo do projeto

Este projeto foi desenvolvido com finalidade **educacional** e como prática de **enumeração de infraestrutura web** em Segurança da Informação.

A ferramenta deve ser utilizada apenas em ambientes autorizados.

---

## 📈 Melhorias futuras

Planejamentos para próximas versões:

* expansão da base de provedores detectáveis
* melhoria da precisão de identificação
* exportação de resultados
* melhorias na interface de saída
