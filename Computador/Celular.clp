;;; SE para ayudar en la decisión de compra de un celular
;;;
;;;

(defrule inicio
=>
(printout t "¡Bienvenido!" crlf)
(printout t "¿Como Estas? *_*" crlf)
(printout t "Este sistema te ayudará a conocer que modelo de celular seria mejor para ti segun ciertos factores" crlf)
(printout t "---------------------------------------------------*-----------------------------------------*---------------------------" crlf)
(printout t "Hecho por Alejandro y Victor" crlf)
(printout t "Por favor responder 1 para un Si y 0 para No" crlf crlf)

;;; Ingreso los hechos que servirán para mostrar las respuesta

(printout t "Necesitas el celular para jugar?" crlf)
(bind ?juegos (read))
(assert (plays ?juegos)) 

(printout t "Necesitas el celular para fotografias Pros?" crlf)
(bind ?fotografias (read))
(assert (photo ?fotografias)) 

(printout t "Necesitas el celular con bastante almacenamiento interno?" crlf)
(bind ?memoria(read))
(assert (memo ?memoria)) 

(printout t "Necesitas que sea carga rapida?" crlf)
(bind ?carga (read))
(assert (cargaR ?carga))

(printout t "Necesitas que sea android?" crlf)
(bind ?android (read))
(assert (andro ?android))

(printout t "Necesitas que sea IOS?" crlf)
(bind ?IOS (read))
(assert (iphone ?IOS))

(printout t "Necesitas que la bateria sea duradera?" crlf)
(bind ?bateria (read))
(assert (bat ?bateria)))


;;; Definir funciones para el cálculo

(deffunction CPU
(?cpuJ ?cpuF ?cpuM ?cpuC ?cpuA ?cpuI ?cpuB)
(+ ?cpuJ ?cpuF ?cpuM ?cpuC ?cpuA ?cpuI ?cpuB))

(deffunction memoria
(?MemJ ?MemF ?MemM ?MemC ?MemA ?MemI ?MemB)
(+ ?MemJ ?MemF ?MemM ?MemC ?MemA ?MemI ?MemB))

(deffunction bater
(?bateJ ?bateF ?bateM ?bateC ?bateA ?bateI ?bateB)
(+ ?bateJ ?bateF ?bateM ?bateC ?bateA ?bateI ?bateB))

(deffunction camara
(?camJ ?camF ?camM ?camC ?camA ?camI ?camB)
(+ ?camJ ?camF ?camM ?camC ?camA ?camI ?camB))



;;; Definir regla para calcular valores de componentes
(defrule muestra-CPU
    (cpu_valor ?cpuJ ?cpuF ?cpuM ?cpuC ?cpuA ?cpuI ?cpuB )
    =>
    (printout t "El consumo minimo que tendría el cpu es del " (CPU ?cpuJ ?cpuF ?cpuM ?cpuC ?cpuA ?cpuI ?cpuB) "%" crlf))

(defrule muestra-memoria
    (memoria_valor ?MemJ ?MemF ?MemM ?MemC ?MemA ?MemI ?MemB)
    =>
    (printout t "El almacenamiento minimo necesaria es: " (memoria ?MemJ ?MemF ?MemM ?MemC ?MemA ?MemI ?MemB) " MB" crlf))

(defrule muestra-bater
    (bater_valor ?bateJ ?bateF ?bateM ?bateC ?bateA ?bateI ?bateB)
    =>
    (printout t "La capacidad nominal de la batería es de: " (bater ?bateJ ?bateF ?bateM ?bateC ?bateA ?bateI ?bateB) "  mAh" crlf))

 (defrule muestra-camara
    (camara_valor ?camJ ?camF ?camM ?camC ?camA ?camI ?camB)
    =>
    (printout t "megapixeles de la camara son: " (camara ?camJ ?camF ?camM ?camC ?camA ?camI ?camB) " MP" crlf))

(defrule recomendacion-android1
  (andro 1)
  (photo 1)
  (memo 1)
  (plays 1)
  (bat 1)
  (cargaR 1 )
  (iphone 0)
  =>
  (printout t "Se recomienda un Huawei P60 Pro." crlf)
    
)

(defrule recomendacion-ios1
  (iphone 1)
  (photo 1)
  (memo 1)
  (plays 1)
  (bat 1)
  (cargaR 1)
  (andro 0)
  =>
  (printout t "Se recomienda un iPhone 14 Pro Max." crlf)
)



 (defrule recomendacion-android2
  (andro 1)
  (photo 1)
  (cargaR 0) 
  (iphone 0)
  (memo 1)
  (bat 1)
  (plays 0)
  =>
  (printout t "Se recomienda un Google Pixel 7 Pro." crlf)
)

(defrule recomendacion-ios

  (iphone 1)
  (memo 0)
  (cargaR 0)
  (bat 0)
  (plays 0)
  (andro 0)
  
  =>
  (printout t "Se recomienda un iPhone X Pro Max." crlf)
)


 (defrule recomendacion-android
  (andro 1)
  (photo 0)
  (cargaR 0) 
  (memo 0)
  (iphone 0)
  (bat 0)
  (plays 0)


  =>
  (printout t "Se recomienda un Samsung Galaxy j2 Edge" crlf)
)

(defrule recomendacion-ios

  (iphone 1)
  (memo 0)
  (cargaR 0)
  (bat 0)
  (plays 0)
  (andro 0)
  (photo 0)
  
  =>
  (printout t "Se recomienda un iPhone 6" crlf)
)


;;; Definir las reglas para las respuesta y asignar los hechos

(defrule respuesta
(plays ?juegos)
(photo ?fotografias)
(memo ?memoria)
(cargaR ?carga)
(andro ?android)
(iphone ?IOS)
(bat ?bateria)


=>
(if (eq ?juegos 1) then
    (bind ?cpu1 50) (bind ?Mem1 512.000) (bind ?bate1 4715) (bind ?cam1 0)
    else (bind ?cpu1 0) (bind ?Mem1 64.000) (bind ?bate1 2500) (bind ?cam1 0)
)
(if (eq ?fotografias 1) then
    (bind ?cpu2 2) (bind ?Mem2 5.000) (bind ?bate2 0.1 ) (bind ?cam2 48)
    else (bind ?cpu2 0) (bind ?Mem2 3.000) (bind ?bate2 0.1) (bind ?cam2 12)
)
(if (eq ?memoria 1) then
    (bind ?cpu3 0) (bind ?Mem3 512.000 ) (bind ?bate3 0.1) (bind ?cam3 0)
    else (bind ?cpu3 0) (bind ?Mem3 64.000) (bind ?bate3 0.1) (bind ?cam3 0)
)
(if (eq ?carga 1) then
    (bind ?cpu4 0) (bind ?Mem4 100 ) (bind ?bate4 0) (bind ?cam4 0)
    else (bind ?cpu4 0) (bind ?Mem4 0.10) (bind ?bate4 0) (bind ?cam4 0)
)
(if (eq ?android 1) then
    (bind ?cpu5 0.2) (bind ?Mem5 5.000) (bind ?bate5 0) (bind ?cam5 0)
    else (bind ?cpu5 0) (bind ?Mem5 0) (bind ?bate5 0) (bind ?cam5 0)
)
(if (eq ?IOS 1) then
    (bind ?cpu6 0.2) (bind ?Mem6 5.000) (bind ?bate6 0) (bind ?cam6 0)
    else (bind ?cpu6 0) (bind ?Mem6 0) (bind ?bate6 0) (bind ?cam6 0)
)
(if (eq ?bateria 1) then
    (bind ?cpu7 0) (bind ?Mem7 100) (bind ?bate7 0) (bind ?cam7 0)
    else (bind ?cpu7 0) (bind ?Mem7 0.10) (bind ?bate7 0) (bind ?cam7 0)
)
(assert (cpu_valor ?cpu1 ?cpu2 ?cpu3 ?cpu4 ?cpu5 ?cpu6 ?cpu7))
(assert (memoria_valor ?Mem1 ?Mem2 ?Mem3 ?Mem4 ?Mem5 ?Mem6 ?Mem7))
(assert (bater_valor ?bate1 ?bate2 ?bate3 ?bate4 ?bate5 ?bate6 ?bate7))
(assert (camara_valor ?cam1 ?cam2 ?cam3 ?cam4 ?cam5 ?cam6 ?cam7))


)
