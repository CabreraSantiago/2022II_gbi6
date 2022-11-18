# Ejercicio 10.2 
# pregunta 1
echo "¿cuantas veces se registraron los niveles de los individuos 3 y 27?"
cd ../../
grep -r "Gesquiere2011" CSB-master/unix/
cd CSB-master/unix/data/
ls
head -n 3 Gesquiere2011_data.csv
cut -f 1 Gesquiere2011_data.csv | head -n 4
echo -e "\n"
echo "Individuo 3"
cut -f 1 Gesquiere2011_data.csv | grep -c -w 3
echo "Individuo 27"
cut -f 1 Gesquiere2011_data.csv | grep -c -w 27
# pregunta 2
echo "escribir un script tomando como entrada el nombre del archivo y el ID de la persona y devolviendo el número de registros para ese ID."
echo "Individuo 3"
bash ../solutions/count_baboons.sh Gesquiere2011_data.csv 3
echo "Individuo 27"
bash ../solutions/count_baboons.sh Gesquiere2011_data.csv 27
echo -e "\n"
# Pregunta 3
echo "escriba un script que devuelva el numero de veces que se muestreo a cada individuo."
echo "Lista"
tail -n +2 Gesquiere2011_data.csv | cut -f 1 | sort -n | uniq
echo "Número de veces que se muestra"
myIDS=`tail -n +2 Gesquiere2011_data.csv | cut -f 1 | sort -n | uniq`
for id in $myIDS
do
	mycounts=`bash ../solutions/count_baboons.sh Gesquiere2011_data.csv $id`
	echo "ID:" $id "counts:" $mycounts
done
