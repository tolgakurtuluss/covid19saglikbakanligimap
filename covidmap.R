###

# Covid 19 Grafiği  https://pbs.twimg.com/media/EUJJFSCWoAIcjDF.jpg
# Veri Kaynağı https://github.com/ozanerturk/covid19-turkey-api


coviddata <- read.csv("https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.csv")

coviddata$date<- as.Date(coviddata$date , format="%d/%m/%Y")

coviddata %>%
  filter(date > "2020-03-01", date < "2020-03-28")%>%
  ggplot()+
  geom_line(aes(x=date, y=totalPatients),color = "#ffae14")+
  geom_point(aes(x=date, y=totalPatients),color = "#ffae14",size=3)+
  geom_label(aes(x=date, y=totalPatients,label=totalPatients),color = "white",fill="#ffae14",size=3,position = position_stack(vjust = 1.05))+
  geom_line(aes(x=date, y=totalDeaths),color = "#da1e08")+
  geom_point(aes(x=date, y=totalDeaths),color = "#da1e08",size=3)+
  geom_label(aes(x=date, y=totalDeaths,label=totalDeaths),color = "white",fill = "#da1e08",size=3,position = position_stack(vjust = 4))+
  scale_y_continuous(labels = seq(0,6000,500),
                     breaks = seq(0,6000,500))+
  scale_x_date(date_breaks = "1 month", date_minor_breaks = "1 day")+
  labs(x = "", y = "", title = "TÜRKİYE GENEL KORONAVİRÜS TABLOSU",subtitle = "MART 2020")+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(color = "white", size = .2),
        panel.grid.minor.x = element_line(color = "gray", size = .1),
        panel.grid.minor.y = element_line(color = "white", size = .2),
        panel.background = element_rect("#00a6a2"),
        plot.background = element_rect("#00a6a2"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(colour="white",size=8,family="Tahoma"),
        axis.title.x = element_text(colour="white"),
        axis.title.y = element_text(colour="white"),
        plot.title = element_text(colour = "white"),
        plot.subtitle = element_text(colour = "white"),
        axis.line.x = element_line(size = 0.8, colour = "white"),
        axis.line.y = element_line(size = 2, colour = "white"))