# Lynis Script Hardering
---

Script básico para la solución de algunas de las sugerencias y alertas de la herramienta de auditoria [Lynis](https://cisofy.com/lynis/).

*¡Antes de lanzar el scritp asegúrese de que este no va a perjudicar el funcionamiento de su SO!*

### Inicio 🚀

Descargue la herramienta *lynis* en su sistema, depende de su instalación localice el binario y ejecute el siguiente comando:

```
# lynis audit system
```

Es recomendable usar el usuario *root* para esta ejecución, pero no es obligatorio.

![Alt text](https://www.ochobitshacenunbyte.com/wp-content/uploads/2017/12/lynis-captura.png "Salida")

### Ejecución 📦

Después de la ejecución ejecutamos el script:

```
# ./lynis_script_hardering.sh
```

Para comparar el resultado de la auditoria del *Lynis* se ejecuta de nuevo el proceso de auditoria.

### Herramientas 🛠

* [Lynis](https://cisofy.com/lynis/) - Auditoria y mejora de seguridad en SO.

### Autores ✒️

* **Moisés Jiménez** - *Trabajo Inicial* - [mjimenes](https://github.com/mjimenes)

---
⌨️ con ❤️ por [SoftlabPeru](https://github.com/softlabperu) 😊
