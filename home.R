### om_skeleton home.R
### Tom Weishaar - Oct 2017 - v0.1
### Skeleton for multi-page, multi-user web site in Shiny, with user authentication

rv$trigger = 0
output$pageStub <- renderUI({
  x = rv$limn
  if(page_debug_on) {
    cat(paste0("Rendering ", webpage$name, " v.", rv$limn, "\n"))
  }
  if(session$userData$user$sp) {
    tagList(
      HTML(paste0('<h4>You are logged in. This is your data:</h4>')),
      dataTableOutput("user")
    )
  } else {
    tagList(
      HTML(paste0("
                <div class='test'>
                <a href='?login'>
                     <img width='600px' height='600px'  
              src='logo.png' alt='larger logo'/> 
              
        </a>
    </div>
    
                   
                  "
                     ))
    )
  }
})

output$user = renderDataTable(session$userData$user)
