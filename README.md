# Laboratorio 04: AWS + Lambda Integration

Este proyecto despliega tres entornos: **dev**, **qa** y **prod**. Cada uno tiene su propia infraestructura con estado independiente.

## Requisitos

- Terraform >= 1.0
- AWS CLI y un perfil configurado
- Node.js 20.x
- npm

## Guía de Despliegue

### 1. Instalar Dependencias de las Lambdas

```bash
cd services/lambdas/crop-lambda
npm install

cd ../sign-lambda
npm install
```

### 2. Desplegar Cada Entorno

Para cada entorno (`dev`, `qa`, `prod`):

```bash
cd environments/{env}
```

#### Configurar Variables

Crear o editar `terraform.tfvars`:

```hcl
aws_region                    = "us-east-1"
aws_profile                   = "your_profile"
aws_availability_zone_main    = "a"
aws_availability_zone_replica = "b"
env                           = "env"
name_prefix                   = "yourn_name"
```

Reemplazar `{env}` por `dev`, `qa` o `prod`.

#### Inicializar y Aplicar

```bash
terraform init
terraform apply
```

## Estructura del Proyecto

- `environments/{dev,qa,prod}` — Configuración Terraform específica por entorno
- `modules/` — Módulos Terraform reutilizables (networking, lambda, storage, sqs, iam, etc.)
- `services/lambdas/{crop-lambda,sign-lambda}` — Funciones Node.js Lambda
- `diagram.mermaid` — Diagrama de la arquitectura
