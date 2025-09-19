awk '
END {
o = "Отчет о логе веб-сервера"
p = "========================"
r = "Общее количество запросов:"
system("echo " o " > report.txt")
system("echo " p " >> report.txt")
system("echo " r "      " NR " >> report.txt")
}' access.log

awk '
{
a[$1]++
}
END{
pr = "                           "
r = "Количество уникальнх IP-адресов:"
print2 = length(a)
system("echo " r "      " print2 " >> report.txt")
system("echo " pr " >> report.txt")
}' access.log

awk '
{
if (match($6,"GET")) {get += 1}
else if (match($6,"POST")) {post += 1}
}
END{
pr = "                           "
prr = "   "
r = "Количество запросов по методам:"
system("echo " r " >> report.txt")
system("echo " prr "" get " GET  >> report.txt")
system("echo " prr "" post " POST  >> report.txt")
system("echo " pr " >> report.txt")
}' access.log

awk '
{
count[$7]++;
    if (count[$7] > max) { # max ещё не задан → считается как 0
        max = count[$7]
}
END{
r = "Самый популярный URL:    "
for (value in count)
if (count[value]==max) {
system("echo " r " " count[value] " " value " >> report.txt")}

}' access.log

awk '
BEGIN {
print "Отчет сохранен в файл report.txt"
}'
