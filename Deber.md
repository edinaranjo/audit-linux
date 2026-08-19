# 🔐 Trabajo Grupal: Auditoría y Hardening de Rocky Linux con Lynis

## Auditoría de Sistemas de Información

---

## 1. Descripción del trabajo

En este trabajo se realizará una **auditoría técnica de seguridad sobre un servidor Rocky Linux**, utilizando **Lynis** como herramienta de apoyo.

La Máquina Virtual (MV) con Rocky Linux será **proporcionada por el docente** y constituirá el entorno oficial sobre el cual deberá desarrollarse el trabajo.

> ⚠️ **No se deberá reinstalar, actualizar, modificar o realizar hardening sobre la MV antes de obtener la auditoría inicial.**

El objetivo del trabajo no consiste únicamente en ejecutar Lynis o incrementar su **Hardening Index**. El estudiante deberá asumir el rol de **auditor de sistemas**, interpretar la evidencia obtenida, investigar las condiciones detectadas, contrastarlas con criterios reconocidos, evaluar los riesgos y comunicar sus conclusiones utilizando lenguaje gerencial.

El proceso general será:

```text
Rocky Linux proporcionado por el docente
                 ↓
          Auditoría Lynis T0
                 ↓
        Resultados / Suggestions
                 ↓
       Investigación y evidencia
                 ↓
       Comparación con criterios
                 ↓
          Análisis de riesgo
                 ↓
       ¿Constituye un hallazgo?
                 ↓
       Recomendación gerencial
                 ↓
        Hardening completo SSH
                 ↓
          Auditoría Lynis T1
                 ↓
       Actualización del sistema
                 ↓
          Auditoría Lynis T2
                 ↓
        Comparación T0/T1/T2
                 ↓
           Riesgo residual
                 ↓
        Conclusiones de auditoría
```

---

# 2. Objetivos de aprendizaje

Al finalizar el trabajo, el estudiante estará en capacidad de:

- Ejecutar una auditoría técnica de seguridad sobre Rocky Linux utilizando Lynis.
- Interpretar los resultados obtenidos sin asumir que una sugerencia constituye automáticamente una vulnerabilidad.
- Obtener evidencia independiente para validar las condiciones identificadas.
- Utilizar documentación oficial, benchmarks y estándares como criterios de auditoría.
- Diferenciar entre **resultado técnico, vulnerabilidad, riesgo, hallazgo y recomendación**.
- Evaluar riesgos mediante probabilidad e impacto.
- Comunicar hallazgos técnicos utilizando lenguaje comprensible para niveles gerenciales.
- Relacionar las condiciones identificadas con controles de seguridad pertinentes.
- Realizar y verificar un proceso de hardening de OpenSSH.
- Evaluar el efecto de las actualizaciones del sistema sobre los resultados de seguridad.
- Comparar diferentes estados del servidor mediante evidencia objetiva.
- Evaluar el riesgo residual posterior al tratamiento.
- Elaborar conclusiones sustentadas en evidencia y juicio profesional.

---

# 3. Modalidad

El trabajo será desarrollado en **grupos de tres estudiantes**.

Todos los grupos utilizarán una MV Rocky Linux con las mismas características iniciales.

Esto permite mantener condiciones comparables:

$$
\text{Mismo entorno inicial} + \text{Misma herramienta} = \text{Baseline comparable}
$$

Cada grupo recibirá adicionalmente un conjunto de **sugerencias de Lynis asignadas por el docente**.

Las sugerencias relacionadas con SSH no formarán parte de esta distribución, debido a que el **hardening de SSH será una actividad común y obligatoria para todos los grupos**.

---

# 4. Escenario de auditoría

Para efectos del análisis se utilizará el siguiente escenario organizacional:

> La organización **ACME Financial Services** utiliza el servidor `SRV-LNX-02`, basado en Rocky Linux, como servidor corporativo para soportar servicios internos de TI.
>
> El servidor procesa y almacena información corporativa de carácter confidencial y es administrado remotamente mediante SSH por personal autorizado.
>
> La organización requiere mantener niveles adecuados de confidencialidad, integridad, disponibilidad y trazabilidad. Los accesos administrativos deben encontrarse debidamente restringidos y las actividades relevantes deben poder ser registradas y posteriormente auditadas.
>
> El equipo de Auditoría de Sistemas ha sido solicitado para evaluar la configuración de seguridad del servidor, identificar exposiciones relevantes y emitir recomendaciones para reducir los riesgos encontrados.

---

# 5. Reglas del laboratorio

Antes de comenzar:

1. Utilizar exclusivamente la MV proporcionada por el docente.
2. No realizar actualizaciones antes de obtener el baseline.
3. No realizar hardening previo.
4. No modificar configuraciones antes de la primera auditoría.
5. No eliminar paquetes o servicios antes del baseline.
6. Mantener evidencia de las actividades realizadas.
7. No asumir que una recomendación de Lynis constituye automáticamente un hallazgo.

> La MV contiene una configuración diseñada exclusivamente para fines académicos y no representa necesariamente una configuración recomendada para producción.

---

# 6. Preparación de Lynis

Utilizar el repositorio oficial:

```bash
git clone https://github.com/CISOfy/lynis.git
```

Acceder:

```bash
cd lynis
```

Si los archivos pertenecen al usuario utilizado para clonar el repositorio, cambiar su propietario antes de ejecutar Lynis con privilegios elevados:

```bash
cd ..
sudo chown -R root:root lynis
cd lynis
```

Verificar:

```bash
ls -ld .
ls -l include/functions
```

---

# 7. Fase 1 — Auditoría inicial T0

Ejecutar:

```bash
sudo ./lynis audit system
```

Esta ejecución constituye:

> **T0 — Baseline de seguridad**

Registrar como mínimo:

| Indicador | T0 |
|---|---:|
| Hardening Index | |
| Tests performed | |
| Warnings | |
| Suggestions | |

Conservar la salida y los archivos generados por Lynis como evidencia.

---

# 8. Principio fundamental del análisis

Una recomendación de Lynis debe interpretarse inicialmente como un **elemento que requiere investigación**.

No utilizar:

```text
Suggestion = Vulnerabilidad = Hallazgo
```

Utilizar:

**Suggestion** → **Investigación** → **Evidencia** → **Criterio** → **Riesgo** → **Conclusión del auditor**

Por tanto:

> **Lynis identifica condiciones técnicas. El auditor determina su relevancia.**

---

# 9. Análisis de las sugerencias asignadas

Cada grupo recibirá del docente un conjunto de sugerencias identificadas durante la auditoría.

Las recomendaciones relacionadas con SSH serán excluidas de esta distribución porque serán tratadas posteriormente como actividad común.

Para **cada sugerencia asignada**, el grupo deberá desarrollar el siguiente análisis.

---

## 9.1 Identificación

Registrar:

```text
ID Lynis:
Nombre de la prueba:
Descripción de la sugerencia:
```

---

## 9.2 ¿Qué indica la sugerencia?

Explicar con palabras propias:

- qué componente está evaluando Lynis;
- qué condición detectó;
- por qué podría ser relevante.

No copiar únicamente la descripción generada por la herramienta.

---

## 9.3 Verificación independiente

El auditor deberá comprobar si la condición existe realmente.

La evidencia puede incluir:

- comandos;
- archivos de configuración;
- estado de servicios;
- paquetes instalados;
- permisos;
- logs;
- parámetros del kernel;
- configuraciones efectivas.

Ejemplo:

```bash
<comando utilizado>
```

Registrar la salida relevante.

> Una captura de Lynis por sí sola no constituye evidencia suficiente cuando la condición puede verificarse directamente.

---

# 10. Determinación del criterio

Una vez confirmada la condición deberá determinarse:

> **¿Contra qué criterio se está comparando el servidor?**

La investigación deberá priorizar:

1. Documentación oficial de Rocky Linux.
2. Manuales del componente evaluado.
3. CIS Benchmark aplicable.
4. Documentación oficial de Lynis/CISOfy.
5. ISO/IEC 27001:2022 e ISO/IEC 27002, cuando corresponda.
6. Otros estándares reconocidos pertinentes.
7. Fuentes técnicas secundarias confiables.

Ejemplos:

```bash
man sshd_config
man login.defs
man auditd
```

> Wikipedia, blogs sin referencias, respuestas generadas automáticamente o foros no deberán utilizarse como único criterio de auditoría.

---

# 11. Relación con estándares y controles

Para cada condición deberá identificarse:

> **El control del Anexo A de ISO/IEC 27001:2022 u otro estándar/baseline de seguridad que pueda utilizarse como criterio o referencia para el tratamiento de la condición.**

La asociación deberá ser **justificada**.

No se considerará suficiente:

```text
ISO 27001: A.x.x
```

Se espera una explicación como:

> La condición se relaciona con el control XXXXX debido a que dicho control busca...

Para configuraciones técnicas específicas podrá resultar más apropiado utilizar un **CIS Benchmark**, documentación del fabricante u otro baseline técnico.

---

# 12. Análisis del riesgo

Una condición confirmada no adquiere criticidad únicamente por el estado mostrado por Lynis.

La criticidad será determinada mediante:

$$
R = P \times I
$$

donde:

- **P = Probabilidad**
- **I = Impacto**
- **R = Nivel de riesgo**

---

## 12.1 Probabilidad

| Valor | Nivel | Descripción |
|---:|---|---|
| 1 | Muy baja | El escenario es poco probable dadas las condiciones existentes. |
| 2 | Baja | Puede ocurrir, pero requiere condiciones poco frecuentes. |
| 3 | Media | Existen condiciones razonables para que ocurra. |
| 4 | Alta | Existen condiciones favorables y exposición relevante. |
| 5 | Muy alta | La exposición es permanente o el escenario resulta altamente probable. |

---

## 12.2 Impacto

| Valor | Nivel | Descripción |
|---:|---|---|
| 1 | Insignificante | Consecuencias mínimas para la organización. |
| 2 | Menor | Afectación limitada y fácilmente recuperable. |
| 3 | Moderado | Afectación relevante pero controlable. |
| 4 | Mayor | Afectación significativa al servicio, información o negocio. |
| 5 | Crítico | Consecuencias severas sobre servicios esenciales, información o cumplimiento. |

---

## 12.3 Clasificación

| Resultado | Nivel |
|---:|---|
| 1–4 | Bajo |
| 5–9 | Medio |
| 10–16 | Alto |
| 17–25 | Crítico |

Ejemplo:

$$
P = 3
$$

$$
I = 4
$$

$$
R = 3 \times 4 = 12
$$

**Nivel de riesgo: Alto**

> El valor numérico deberá estar acompañado de una justificación. No se calificará únicamente el número seleccionado.

---

# 13. Determinación del hallazgo

Después de obtener evidencia y analizar el criterio y riesgo, responder:

> **¿La condición identificada constituye un hallazgo de auditoría para el escenario evaluado?**

```text
Sí / No
```

Justificar.

Es perfectamente válido concluir:

> **No constituye un hallazgo.**

si el grupo demuestra que:

- el criterio no resulta aplicable;
- existe un control compensatorio;
- la condición no representa una desviación;
- el riesgo no resulta relevante para el escenario;
- la recomendación de Lynis no aplica al propósito del servidor.

> La capacidad de descartar justificadamente una recomendación también constituye ejercicio de juicio profesional.

---

# 14. Comunicación gerencial

Para aquellas condiciones consideradas hallazgos deberá elaborarse una explicación gerencial.

La explicación debe responder:

### ¿Qué ocurre?

Explicar la condición sin terminología Linux innecesaria.

### ¿Por qué importa?

Explicar el riesgo para la organización.

### ¿Qué podría ocurrir?

Describir consecuencias sobre:

- confidencialidad;
- integridad;
- disponibilidad;
- trazabilidad;
- cumplimiento;
- operación.

### ¿Qué debería hacer la organización?

Formular una recomendación comprensible para la administración.

---

## Ejemplo de comunicación técnica incorrecta

> `sshd_config` mantiene MaxSessions=10 y Lynis SSH-7408 recomienda 2.

## Ejemplo de comunicación gerencial

> El servicio utilizado para la administración remota mantiene capacidades superiores a las requeridas para la operación prevista, incrementando innecesariamente la superficie disponible ante el eventual compromiso de una sesión administrativa. Se recomienda limitar las capacidades del servicio al mínimo operacional requerido y verificar periódicamente su configuración.

---

# 15. Matriz de análisis

Cada grupo deberá presentar una matriz consolidada:

| ID | Condición | Evidencia | Criterio | Riesgo | P | I | R | Nivel | ¿Hallazgo? |
|---|---|---|---|---|---:|---:|---:|---|---|
| XXX | ... | ... | ... | ... |  |  |  |  | Sí/No |
| XXX | ... | ... | ... | ... |  |  |  |  | Sí/No |

Posteriormente deberá desarrollarse individualmente cada condición.

---

# 16. Formato de documentación de cada condición

## H-XX — Título

### Resultado de Lynis

```text
ID:
Suggestion:
```

### Condición

Describir qué fue identificado.

### Evidencia

```bash
<comandos utilizados>
```

Explicar qué demuestra la evidencia.

### Criterio

Indicar:

- estándar;
- benchmark;
- documentación;
- control;

y justificar su aplicabilidad.

### Riesgo

Explicar qué podría ocurrir.

### Probabilidad

```text
Valor:
Justificación:
```

### Impacto

```text
Valor:
Justificación:
```

### Evaluación

$$
R = P \times I
$$

```text
Nivel:
```

### ¿Constituye hallazgo?

```text
Sí / No
```

Justificación:

### Recomendación gerencial

Explicar qué debería hacer la organización.

### Posible solución técnica

Describir las acciones técnicas que podrían implementarse.

> Las sugerencias asignadas para análisis **no deberán ser necesariamente implementadas**. El objetivo de esta fase es actuar como auditor y formular recomendaciones sustentadas.

---

# 17. Fase 2 — Hardening completo de SSH

Todos los grupos realizarán una evaluación y hardening del servicio OpenSSH.

Esta fase será común.

## Objetivo

Evaluar la configuración efectiva de SSH y aplicar medidas de hardening apropiadas al escenario.

---

## 17.1 Obtener baseline SSH

Antes de modificar el servicio:

```bash
sudo sshd -T
```

Guardar la salida:

```bash
sudo sshd -T > ssh_baseline.txt
```

Investigar particularmente las recomendaciones `SSH-7408` identificadas por Lynis.

Entre otros parámetros pueden aparecer:

```text
AllowTcpForwarding
AllowAgentForwarding
ClientAliveCountMax
LogLevel
MaxAuthTries
MaxSessions
TCPKeepAlive
X11Forwarding
```

> No aplicar valores mecánicamente. Cada configuración deberá investigarse y justificarse.

---

# 18. Backup antes del hardening

Antes de modificar SSH:

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```

Si existen archivos adicionales:

```bash
ls -la /etc/ssh/sshd_config.d/
```

conservar evidencia.

---

# 19. Implementación del hardening SSH

El grupo deberá:

1. Identificar los parámetros recomendados por Lynis.
2. Consultar documentación oficial.
3. Determinar un valor apropiado.
4. Justificarlo.
5. Implementarlo.
6. Validar la configuración.
7. Comprobar la configuración efectiva.

Para cada parámetro:

| Parámetro | Valor inicial | Valor propuesto | Justificación | Fuente |
|---|---|---|---|---|
| MaxSessions | | | | |
| MaxAuthTries | | | | |
| X11Forwarding | | | | |
| ... | | | | |

---

# 20. Validación de SSH

Antes de recargar o reiniciar SSH:

```bash
sudo sshd -t
```

Si existe algún error:

> **NO reiniciar ni recargar el servicio.**

Corregir primero la configuración.

Una vez validada:

```bash
sudo systemctl reload sshd
```

> En Rocky Linux el nombre habitual del servicio es `sshd`.

Verificar:

```bash
sudo systemctl status sshd
```

y:

```bash
sudo sshd -T
```

Guardar:

```bash
sudo sshd -T > ssh_hardened.txt
```

---

# 21. Comparación SSH

Puede utilizarse:

```bash
diff ssh_baseline.txt ssh_hardened.txt
```

Analizar:

> ¿Qué configuraciones cambiaron y qué objetivo de seguridad persigue cada modificación?

---

# 22. Fase 3 — Auditoría T1

Después del hardening SSH, **antes de actualizar Rocky Linux**, ejecutar nuevamente Lynis:

```bash
sudo ./lynis audit system
```

Esta medición constituye:

> **T1 — Estado posterior al hardening SSH**

Registrar:

| Indicador | T0 | T1 | Diferencia |
|---|---:|---:|---:|
| Hardening Index | | | |
| Tests performed | | | |
| Warnings | | | |
| Suggestions | | | |

Calcular:

$$
\Delta HI_{SSH}=HI_{T1}-HI_{T0}
$$

---

# 23. Análisis del hardening SSH

Responder:

1. ¿Qué recomendaciones SSH desaparecieron?
2. ¿Cuáles permanecieron?
3. ¿Por qué podrían permanecer?
4. ¿Cambió el Hardening Index?
5. ¿En qué magnitud?
6. ¿Puede concluirse que SSH es completamente seguro?
7. ¿Qué riesgos permanecen?

> La ausencia de una sugerencia en Lynis constituye evidencia útil, pero no demuestra por sí sola la eliminación total del riesgo.

---

# 24. Fase 4 — Actualización de Rocky Linux

Una vez obtenida T1, realizar la actualización del sistema.

Antes:

```bash
sudo dnf check-update
```

Registrar la evidencia.

Posteriormente:

```bash
sudo dnf upgrade
```

Confirmar la operación cuando corresponda.

> La actualización deberá realizarse **después de T1** para poder diferenciar su efecto del hardening SSH.

Si la actualización incluye componentes que requieren reinicio, documentarlo y proceder de manera controlada.

---

# 25. Verificación posterior a la actualización

Registrar:

```bash
cat /etc/rocky-release
```

```bash
uname -r
```

```bash
sudo dnf check-update
```

Documentar:

- paquetes actualizados;
- cambios relevantes;
- necesidad o no de reinicio;
- estado final.

---

# 26. Fase 5 — Auditoría T2

Ejecutar por tercera vez:

```bash
sudo ./lynis audit system
```

Esta medición constituye:

> **T2 — Estado posterior a la actualización**

Registrar:

| Indicador | T0 Baseline | T1 SSH | T2 Actualizado |
|---|---:|---:|---:|
| Hardening Index | | | |
| Tests performed | | | |
| Warnings | | | |
| Suggestions | | | |

---

# 27. Análisis comparativo

Calcular:

### Efecto del hardening SSH

$$
\Delta HI_{SSH}=HI_{T1}-HI_{T0}
$$

### Efecto posterior de la actualización

$$
\Delta HI_{Update}=HI_{T2}-HI_{T1}
$$

### Variación total

$$
\Delta HI_{Total}=HI_{T2}-HI_{T0}
$$

También puede calcularse:

$$
\text{Mejora relativa}=
\frac{HI_{T2}-HI_{T0}}
{HI_{T0}}
\times100
$$

---

# 28. Interpretación del Hardening Index

El Hardening Index deberá utilizarse como **indicador comparativo**, no como certificación de seguridad.

No concluir:

> “El servidor obtuvo 80 puntos, por tanto está 80 % seguro.”

Tampoco:

> “El servidor ahora es seguro porque aumentó el Hardening Index.”

Interpretación correcta:

> El indicador permite observar cambios en el nivel de hardening detectado por las pruebas de Lynis entre diferentes estados del mismo servidor.

Por tanto:

$$
\Delta HI > 0
\not\Rightarrow
\text{ausencia de riesgo}
$$

---

# 29. Riesgo residual

Para el hardening SSH deberá analizarse el riesgo antes y después del tratamiento.

Ejemplo:

### Riesgo inicial

$$
R_i=P_i\times I_i
$$

### Riesgo residual

$$
R_r=P_r\times I_r
$$

Presentar:

| Riesgo | P | I | Nivel |
|---|---:|---:|---|
| Inicial | | | |
| Residual | | | |

Responder:

> ¿Por qué el riesgo residual no necesariamente llega a cero?

---

# 30. Análisis de la actualización del sistema

El grupo deberá responder en lenguaje gerencial:

### 1. ¿Por qué es importante mantener actualizado un servidor?

### 2. ¿Qué riesgos puede generar operar con software desactualizado?

Considerar:

- vulnerabilidades conocidas;
- estabilidad;
- soporte;
- exposición;
- compatibilidad;
- cumplimiento.

### 3. ¿Actualizar elimina todas las vulnerabilidades?

Justificar.

### 4. ¿La actualización modificó el Hardening Index?

Explicar por qué sí o por qué no.

### 5. ¿Qué diferencia existe entre actualización y hardening?

Esta pregunta es especialmente importante.

```text
Actualización
        ≠
Hardening
```

La actualización busca, entre otros objetivos, incorporar correcciones y versiones mantenidas.

El hardening busca reducir la superficie de ataque y configurar el sistema de acuerdo con un baseline de seguridad.

Ambas actividades son complementarias.

---

# 31. Análisis gerencial del hardening SSH

El grupo deberá elaborar una conclusión destinada a la gerencia explicando:

- por qué SSH constituye un servicio relevante;
- qué riesgo representa una configuración excesivamente permisiva;
- qué medidas fueron implementadas;
- qué evidencia demuestra la mejora;
- qué riesgos permanecen;
- qué recomendaciones adicionales deberían considerarse.

> No incluir comandos Linux en esta sección.

---

# 32. Conclusiones generales

El grupo deberá presentar conclusiones sustentadas en la evidencia obtenida.

Como mínimo deberán abordar:

1. Estado inicial del servidor.
2. Principales riesgos identificados.
3. Diferencia entre sugerencias de Lynis y hallazgos de auditoría.
4. Importancia de validar independientemente los resultados.
5. Impacto del hardening SSH.
6. Impacto de la actualización.
7. Variación del Hardening Index.
8. Limitaciones del Hardening Index.
9. Riesgos residuales.
10. Importancia del juicio profesional del auditor.

Evitar conclusiones genéricas como:

> “La práctica fue interesante y aprendimos mucho sobre Linux.”

Las conclusiones deberán derivarse de **evidencia obtenida durante la auditoría**.

---

# 33. Estructura del informe

El informe final deberá contener:

## 1. Portada

- Institución
- Asignatura
- Trabajo
- Integrantes
- Fecha

## 2. Resumen ejecutivo

Máximo una página.

Debe permitir a un lector gerencial comprender:

- qué se auditó;
- qué se encontró;
- cuáles son los principales riesgos;
- qué acciones se realizaron;
- cuál fue el resultado general.

## 3. Alcance

Describir:

- servidor evaluado;
- herramienta;
- alcance técnico;
- limitaciones.

## 4. Metodología

Explicar:

```text
Lynis
→ Evidencia
→ Criterio
→ Riesgo
→ Hallazgo
→ Recomendación
```

## 5. Auditoría inicial T0

Presentar resultados principales.

## 6. Análisis de las sugerencias asignadas

Incluir matriz y análisis individual.

## 7. Hardening SSH

Documentar:

- baseline;
- análisis;
- configuración;
- evidencia;
- validación.

## 8. Auditoría T1

Analizar el efecto del hardening.

## 9. Actualización

Documentar proceso y resultados.

## 10. Auditoría T2

Presentar resultados finales.

## 11. Comparación T0/T1/T2

Incluir métricas y análisis.

## 12. Riesgo residual

Analizar especialmente SSH.

## 13. Conclusiones

Orientadas a auditoría y riesgo.

## 14. Referencias

Documentar todas las fuentes utilizadas.

## 15. Anexos

Incluir evidencia técnica relevante.

---

# 34. Evidencias mínimas

El informe deberá contener evidencia suficiente para demostrar:

- auditoría T0;
- Suggestions asignadas;
- verificaciones independientes;
- configuración SSH inicial;
- configuración SSH final;
- validación `sshd -t`;
- auditoría T1;
- actualización del sistema;
- auditoría T2;
- resultados finales.

> No llenar el cuerpo principal del informe con capturas innecesarias. Las evidencias extensas deberán incluirse como anexos.

---

# 35. Fuentes recomendadas

Priorizar:

### Rocky Linux Documentation

https://docs.rockylinux.org/

### Lynis

https://cisofy.com/lynis/

### Lynis Controls

https://cisofy.com/lynis/controls/

### CIS Benchmarks

https://www.cisecurity.org/cis-benchmarks

### OpenSSH

https://www.openssh.com/

### ISO/IEC 27001

Utilizar la versión y controles indicados por el docente.

---

# 36. Criterios de calidad

Un trabajo de alto nivel académico deberá demostrar:

### Evidencia

Las afirmaciones están respaldadas por información obtenida del servidor.

### Criterio

Las conclusiones se comparan con referencias pertinentes.

### Análisis

El estudiante explica **por qué** una condición representa un riesgo.

### Juicio profesional

No se acepta automáticamente cada sugerencia de Lynis como hallazgo.

### Comunicación

Se diferencia claramente entre lenguaje técnico y gerencial.

### Trazabilidad

Es posible relacionar:

```text
Resultado Lynis
       ↓
Evidencia
       ↓
Criterio
       ↓
Riesgo
       ↓
Hallazgo
       ↓
Recomendación
```

### Reproducibilidad

Otro auditor debería poder comprender cómo se obtuvo la evidencia y repetir las verificaciones realizadas.

---

# 37. Errores que deben evitarse

❌ Considerar todas las Suggestions como vulnerabilidades.

❌ Asignar criticidad directamente según el estado mostrado por Lynis.

❌ Utilizar únicamente Lynis como evidencia.

❌ Copiar literalmente la explicación de Lynis.

❌ Proponer una solución sin citar un criterio o fuente técnica.

❌ Asignar Probabilidad e Impacto sin justificación.

❌ Considerar que incrementar el Hardening Index demuestra seguridad total.

❌ Reiniciar SSH sin validar previamente la configuración.

❌ Actualizar antes de obtener T0 y T1.

❌ Confundir actualización con hardening.

❌ Considerar que un control elimina completamente el riesgo.

❌ Presentar comandos Linux como recomendación gerencial.

---

# 38. Preguntas finales de reflexión

Cada grupo deberá responder:

### 1.
¿Por qué una herramienta automatizada como Lynis no puede sustituir el juicio profesional de un auditor?

### 2.
¿Todas las recomendaciones identificadas por Lynis representan el mismo nivel de riesgo?

### 3.
¿Encontraron alguna sugerencia que, después del análisis, no consideraron un hallazgo? Justifique.

### 4.
¿Qué diferencia existe entre una debilidad técnica y un riesgo para el negocio?

### 5.
¿Qué aportó el hardening SSH al estado de seguridad del servidor?

### 6.
¿Qué aportó la actualización del sistema?

### 7.
¿Por qué actualización y hardening son controles complementarios?

### 8.
¿Un Hardening Index elevado permite concluir que un sistema es seguro?

### 9.
¿Qué riesgos permanecieron después de las acciones realizadas?

### 10.
Si este servidor estuviera en producción, ¿qué tres acciones recomendaría prioritariamente a la gerencia y por qué?

---

# 39. Principio central del trabajo

> **Lynis no realiza la auditoría por el auditor. Lynis proporciona evidencia técnica que debe ser interpretada, validada y contextualizada. El valor profesional del auditor se encuentra en transformar esa evidencia en información útil para la toma de decisiones.**

Por tanto:

**Herramienta** → **Evidencia** → **Criterio** → **Riesgo** → **Juicio profesional** → **Decisión**

---

# 40. Resultado esperado

Al finalizar el trabajo, el grupo deberá ser capaz de demostrar que:

> No se limitó a ejecutar una herramienta de hardening, sino que realizó un proceso estructurado de auditoría técnica, obtuvo evidencia, evaluó riesgos, formuló conclusiones y verificó objetivamente el efecto de acciones de seguridad sobre un servidor Linux.
