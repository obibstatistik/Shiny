library(foreach)
library(shiny)
library(shinydashboard)
library(shinyjs)

dirs <- list.dirs(path = ".", recursive=FALSE)

dashboardPage(
  skin = "blue",
  
  dashboardHeader(
    title = "Statistik Obib"
  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Statistik Dashboards", tabName = "dashboards", icon = icon("bar-chart", lib="font-awesome")),
      menuItem("Kilder", tabName = "kilder", icon = icon("file-text-o", lib="font-awesome")),
      menuItem("Datasikkerhed", tabName = "datasikkerhed", icon = icon("file-text-o", lib="font-awesome")),
      menuItem("Dokumentation", tabName = "dokumentation", icon = icon("file-text-o", lib="font-awesome")
      )
    )
  ),
  
  dashboardBody(
    tabItems(
    
      tabItem(tabName = "dashboards",
        fixedPage(column(12,
          foreach(i=dirs) %do%  
            if (file.exists(paste0((gsub(".*/", "", i)),"/readme.md"))) { 
              box(width = 6,includeMarkdown(paste0((gsub(".*/", "", i)),"/readme.md"))) 
            }                      
          )
        )
      ),
      tabItem(tabName = "kilder",
        box(width = 12,
          includeMarkdown("kilder.md")
        )
      ),
      tabItem(tabName = "datasikkerhed",
        box(width = 12,
          includeMarkdown("datasikkerhed.md")
        )
      ),
      tabItem(tabName = "dokumentation",
        box(width = 12,
          includeMarkdown("dokumentation.md")
        )
      )
    )
  )
)