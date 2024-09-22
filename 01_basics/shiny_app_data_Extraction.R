# Uncomment and run the following lines to install any missing packages
# install.packages("shiny")
# install.packages("writexl")
# install.packages("readxl")
# install.packages("DT")
# install.packages("shinyjs")
# install.packages("shinythemes")

library(shiny)
library(writexl)
library(DT)
library(shinyjs)
library(shinythemes)

# Define UI for the application
ui <- fluidPage(
  useShinyjs(),  # Include shinyjs
  
  theme = shinytheme("cerulean"),  # Add a theme for colors
  
  titlePanel("Meta-analysis Data Entry Application"),
  
  # Add subtitle
  h4("This app is developed by Muhammad Aammar Tufail (PhD)"),
  
  # Place action buttons and file upload at the top
  fluidRow(
    column(
      width = 12,
      actionButton("clear_results", "Clear Results", class = "btn-danger"),
      actionButton("toggle_data", "Show Data", class = "btn-info"),
      actionButton("undo", "Undo", class = "btn-secondary"),
      actionButton("redo", "Redo", class = "btn-secondary"),
      downloadButton("downloadData", "Download Excel", class = "btn-warning"),
      actionButton("example_run", "Example Run", class = "btn-secondary")
    )
  ),
  
  br(),
  
  # Main Layout with two tabs: Data Entry and Results
  tabsetPanel(
    id = "main_tabs",
    
    # Data Entry Tab
    tabPanel("Data Entry",
             fluidRow(
               # First Column
               column(
                 width = 6,
                 # Paper Information Section
                 wellPanel(
                   h3("Paper Information"),
                   numericInput("paper_id", "Paper ID", value = 1),
                   textInput("title", "Title of the paper"),
                   textAreaInput("abstract", "Abstract"),
                   textInput("doi", "DOI"),
                   numericInput("year", "Year", value = 2025, min = 1960, max = 2030),
                   dateInput("submission_date", "Submission Date"),
                   dateInput("acceptance_date", "Acceptance Date"),
                   dateInput("publication_date", "Publication Date"),
                   numericInput("days_submission_publication", "Days from Submission to Publication", value = NA)
                 ),
                 
                 # Authors Section
                 wellPanel(
                   h3("Authors"),
                   numericInput("number_of_authors", "Number of Authors", value = 1, min = 1),
                   h4("First Author"),
                   textInput("first_author", "First Author Name (First Name, Last Name)"),
                   textInput("first_author_id", "First Author ID URL (ORCID, ResearchGate, or any other)"),
                   numericInput("first_author_hindex", "h-Index of Author", value = NA),
                   numericInput("first_author_i10index", "i10 index", value = NA),
                   h4("Last Author"),
                   textInput("last_author", "Last Author Name (First Name, Last Name)"),
                   textInput("last_author_id", "Last Author ID URL (ORCID, ResearchGate, or any other)"),
                   numericInput("last_author_hindex", "h-Index of Author", value = NA),
                   numericInput("last_author_i10index", "i10 index", value = NA),
                   h4("Corresponding Author"),
                   textInput("corresponding_author", "Corresponding Author Name (First Name, Last Name)"),
                   textInput("corresponding_author_id", "Corresponding Author ID URL (ORCID, ResearchGate, or any other)"),
                   numericInput("corresponding_author_hindex", "h-Index of Author", value = NA),
                   numericInput("corresponding_author_i10index", "i10 index", value = NA),
                   textInput("corresponding_author_email", "Email Address of Corresponding Author(s)"),
                   textInput("group_lab_name", "Group or Lab Name"),
                   textInput("institute_name", "Institute Name"),
                   textInput("institute_country", "Country Name of Institute")
                 )
               ),
               
               # Second Column
               column(
                 width = 6,
                 # Publication Metrics Section
                 wellPanel(
                   h3("Publication Metrics"),
                   textInput("journal_name", "Journal Name"),
                   numericInput("impact_factor", "Impact Factor", value = NA),
                   numericInput("citation_score", "Citation Score", value = NA),
                   textInput("publisher", "Publisher (Wiley, Elsevier, Springer, etc.)"),
                   numericInput("cited_by", "Cited by how many papers (num)", value = NA),
                   numericInput("altmetric_score", "Altmetric/PlumX Score", value = NA)
                 ),
                 
                 # Research Details Section
                 wellPanel(
                   h3("Research Details"),
                   textInput("country_of_research", "Country of Research"),
                   textInput("continent", "Continent"),
                   textInput("keywords", "Add Keywords (Separated by , or ;)"),
                   selectInput("access_type", "Access Type", choices = c("Open Access", "Subscription", "Other")),
                   textInput("funding_source", "Funding Source (Write complete funding details)"),
                   textAreaInput("data_availability", "Data Availability (Write detailed information if data is on any other platform and available)"),
                   numericInput("word_count", "Word count without references", value = NA),
                   numericInput("number_of_references", "Number of References", value = NA),
                   selectInput("sdg_mention", "SDG mention", choices = c("Yes", "No")),
                   textInput("sdg_no", "SDG No. (Separated by ,)", value = NA)
                 ),
                 
                 # Experimental Details Section
                 wellPanel(
                   h3("Experimental Details"),
                   textInput("bacterial_genus", "Bacterial Genus"),
                   textInput("bacterial_species", "Bacterial Species"),
                   textInput("bacterial_strain", "Bacterial Strain name/number"),
                   selectInput("gram_test", "Gram-test", choices = c("Gram-positive", "Gram-negative", "Unknown")),
                   textInput("crop_name", "Crop Name"),
                   textInput("variety", "Variety"),
                   selectInput("crop_group", "Crop Group", choices = c("Cereals", "Pulses", "Vegetables", "Medicinal", "Orchards", "Other")),
                   selectInput("c3_c4", "C3/C4", choices = c("C3", "C4", "Other")),
                   selectInput("mono_di_cotyledon", "Mono/di-Cotyledon", choices = c("Monocotyledon", "Dicotyledon", "Other")),
                   selectInput("inoculation_method", "Inoculation Method", choices = c("Seed", "Seedling/Root", "Soil", "Foliar", "Other")),
                   selectInput("experiment_type", "Experiment Type", choices = c("In-vitro", "Growth Chamber", "Greenhouse/Pot", "Field", "Other")),
                   numericInput("salinity", "Salinity (mM)", value = NA),
                   textAreaInput("comments", "Comments (Write about the things where you used 'Other' option)")
                 )
               )
             ),
             
             # Submit Button at the Bottom of Data Entry
             fluidRow(
               column(
                 width = 12,
                 actionButton("submit_entry", "Submit Results", class = "btn-success")
               )
             )
    ),
    
    # Results Tab
    tabPanel("Results",
             fluidPage(
               h3("All Results"),
               
               # Data Section to be toggled
               hidden(
                 div(
                   id = "data_section",
                   DTOutput("all_data_table")
                 )
               ),
               
               br(),
               
               h4("Manage Results"),
               uiOutput("results_ui"),
               fluidRow(
                 column(4, actionButton("add_result", "Add Result", class = "btn-primary")),
                 column(4, actionButton("update_result", "Update Result", class = "btn-warning")),
                 column(4, actionButton("delete_result", "Delete Result", class = "btn-danger"))
               ),
               
               br(), br(),
               
               DTOutput("results_table"),
               
               # Submit Button at the Bottom of Results
               fluidRow(
                 column(
                   width = 12,
                   actionButton("submit_results", "Submit Results", class = "btn-success")
                 )
               )
             )
    )
  ),
  
  # Footer
  br(),
  hr(),
  p("© Copyrights reserved by codanics", align = "center")
)

# Define server logic
server <- function(input, output, session) {
  # Helper function to safely get input values
  safe_input <- function(x) {
    if (is.null(x) || length(x) == 0 || (is.character(x) && trimws(x) == "")) {
      return(NA)
    } else {
      return(x)
    }
  }
  
  # Initialize reactive values
  rv <- reactiveValues(
    results_list = list(),
    all_data = NULL,  # Initialize as NULL
    editing_result = FALSE,
    editing_index = NULL,
    undo_stack = list(),
    redo_stack = list(),
    data_visible = FALSE,  # Track visibility of data_section
    file_name = NULL  # Store the file name entered by user for saving
  )
  
  # Dynamic UI for Results
  output$results_ui <- renderUI({
    tagList(
      textInput("response_variable", "Response Variable"),
      h3("Un-inoculated Plants"),
      h4("Control Group"),
      numericInput("mean_control_uninoculated", "Mean (Control)", value = NA),
      numericInput("sd_control_uninoculated", "SD (Control)", value = NA),
      numericInput("n_control_uninoculated", "N (Control)", value = NA),
      h4("Treatment Group"),
      numericInput("mean_treatment_uninoculated", "Mean (Treatment)", value = NA),
      numericInput("sd_treatment_uninoculated", "SD (Treatment)", value = NA),
      numericInput("n_treatment_uninoculated", "N (Treatment)", value = NA),
      h3("Inoculated Plants"),
      h4("Control Group"),
      numericInput("mean_control_inoculated", "Mean (Control)", value = NA),
      numericInput("sd_control_inoculated", "SD (Control)", value = NA),
      numericInput("n_control_inoculated", "N (Control)", value = NA),
      h4("Treatment Group"),
      numericInput("mean_treatment_inoculated", "Mean (Treatment)", value = NA),
      numericInput("sd_treatment_inoculated", "SD (Treatment)", value = NA),
      numericInput("n_treatment_inoculated", "N (Treatment)", value = NA)
    )
  })
  
  # Function to reset all inputs to default values
  reset_inputs <- function() {
    updateNumericInput(session, "paper_id", value = 1)
    updateTextInput(session, "title", value = "")
    updateTextAreaInput(session, "abstract", value = "")
    updateTextInput(session, "doi", value = "")
    updateNumericInput(session, "year", value = 2025)
    updateDateInput(session, "submission_date", value = NULL)
    updateDateInput(session, "acceptance_date", value = NULL)
    updateDateInput(session, "publication_date", value = NULL)
    updateNumericInput(session, "days_submission_publication", value = NA)
    
    updateNumericInput(session, "number_of_authors", value = 1)
    updateTextInput(session, "first_author", value = "")
    updateTextInput(session, "first_author_id", value = "")
    updateNumericInput(session, "first_author_hindex", value = NA)
    updateNumericInput(session, "first_author_i10index", value = NA)
    updateTextInput(session, "last_author", value = "")
    updateTextInput(session, "last_author_id", value = "")
    updateNumericInput(session, "last_author_hindex", value = NA)
    updateNumericInput(session, "last_author_i10index", value = NA)
    updateTextInput(session, "corresponding_author", value = "")
    updateTextInput(session, "corresponding_author_id", value = "")
    updateNumericInput(session, "corresponding_author_hindex", value = NA)
    updateNumericInput(session, "corresponding_author_i10index", value = NA)
    updateTextInput(session, "corresponding_author_email", value = "")
    updateTextInput(session, "group_lab_name", value = "")
    updateTextInput(session, "institute_name", value = "")
    updateTextInput(session, "institute_country", value = "")
    
    updateTextInput(session, "journal_name", value = "")
    updateNumericInput(session, "impact_factor", value = NA)
    updateNumericInput(session, "citation_score", value = NA)
    updateTextInput(session, "publisher", value = "")
    updateNumericInput(session, "cited_by", value = NA)
    updateNumericInput(session, "altmetric_score", value = NA)
    
    updateTextInput(session, "country_of_research", value = "")
    updateTextInput(session, "continent", value = "")
    updateTextInput(session, "keywords", value = "")
    updateSelectInput(session, "access_type", selected = "Open Access")
    updateTextInput(session, "funding_source", value = "")
    updateTextAreaInput(session, "data_availability", value = "")
    updateNumericInput(session, "word_count", value = NA)
    updateNumericInput(session, "number_of_references", value = NA)
    updateSelectInput(session, "sdg_mention", selected = "No")
    updateTextInput(session, "sdg_no", value = NA)
    
    updateTextInput(session, "bacterial_genus", value = "")
    updateTextInput(session, "bacterial_species", value = "")
    updateTextInput(session, "bacterial_strain", value = "")
    updateSelectInput(session, "gram_test", selected = "Unknown")
    updateTextInput(session, "crop_name", value = "")
    updateTextInput(session, "variety", value = "")
    updateSelectInput(session, "crop_group", selected = "Cereals")
    updateSelectInput(session, "c3_c4", selected = "C3")
    updateSelectInput(session, "mono_di_cotyledon", selected = "Monocotyledon")
    updateSelectInput(session, "inoculation_method", selected = "Seed")
    updateSelectInput(session, "experiment_type", selected = "In-vitro")
    updateNumericInput(session, "salinity", value = NA)
    updateTextAreaInput(session, "comments", value = "")
  }
  
  # Observe the "Clear Results" button to reset all fields to default values
  observeEvent(input$clear_results, {
    reset_inputs()
    showNotification("All fields have been reset to default values.", type = "message")
  })
  
  # Function to prompt for file name if not already set
  prompt_for_filename <- function() {
    if (is.null(rv$file_name)) {
      showModal(modalDialog(
        title = "Save As",
        textInput("save_as_filename", "Enter file name for saving results:", ""),
        footer = tagList(
          modalButton("Cancel"),
          actionButton("save_file_name", "Save")
        )
      ))
    }
  }
  
  # Handle saving of file name from modal dialog
  observeEvent(input$save_file_name, {
    req(input$save_as_filename)
    rv$file_name <- paste0(input$save_as_filename, ".xlsx")
    removeModal()
    showNotification(paste("File will be saved as:", rv$file_name), type = "message")
  })
  
  # Function to handle submission of data
  submit_data <- function() {
    # Prompt for file name if not already provided
    prompt_for_filename()
    
    # Collect study-level data using the safe_input function
    current_study <- data.frame(
      PaperID = safe_input(input$paper_id),
      NumberOfAuthors = safe_input(input$number_of_authors),
      FirstAuthor = safe_input(input$first_author),
      FirstAuthorID = safe_input(input$first_author_id),
      FirstAuthor_hIndex = safe_input(input$first_author_hindex),
      FirstAuthor_i10Index = safe_input(input$first_author_i10index),
      LastAuthor = safe_input(input$last_author),
      LastAuthorID = safe_input(input$last_author_id),
      LastAuthor_hIndex = safe_input(input$last_author_hindex),
      LastAuthor_i10Index = safe_input(input$last_author_i10index),
      CorrespondingAuthor = safe_input(input$corresponding_author),
      CorrespondingAuthorID = safe_input(input$corresponding_author_id),
      CorrespondingAuthor_hIndex = safe_input(input$corresponding_author_hindex),
      CorrespondingAuthor_i10Index = safe_input(input$corresponding_author_i10index),
      CorrespondingAuthorEmail = safe_input(input$corresponding_author_email),
      GroupLabName = safe_input(input$group_lab_name),
      InstituteName = safe_input(input$institute_name),
      InstituteCountry = safe_input(input$institute_country),
      Year = safe_input(input$year),
      Title = safe_input(input$title),
      Abstract = safe_input(input$abstract),
      DOI = safe_input(input$doi),
      CountryOfResearch = safe_input(input$country_of_research),
      Continent = safe_input(input$continent),
      JournalName = safe_input(input$journal_name),
      ImpactFactor = safe_input(input$impact_factor),
      CitationScore = safe_input(input$citation_score),
      Publisher = safe_input(input$publisher),
      SubmissionDate = safe_input(input$submission_date),
      AcceptanceDate = safe_input(input$acceptance_date),
      PublicationDate = safe_input(input$publication_date),
      DaysSubmissionPublication = safe_input(input$days_submission_publication),
      CitedBy = safe_input(input$cited_by),
      AltmetricScore = safe_input(input$altmetric_score),
      AccessType = safe_input(input$access_type),
      FundingSource = safe_input(input$funding_source),
      DataAvailability = safe_input(input$data_availability),
      WordCount = safe_input(input$word_count),
      NumberOfReferences = safe_input(input$number_of_references),
      SDGMention = safe_input(input$sdg_mention),
      SDGNo = safe_input(input$sdg_no),
      Keywords = safe_input(input$keywords),
      BacterialGenus = safe_input(input$bacterial_genus),
      BacterialSpecies = safe_input(input$bacterial_species),
      BacterialStrain = safe_input(input$bacterial_strain),
      GramTest = safe_input(input$gram_test),
      CropName = safe_input(input$crop_name),
      Variety = safe_input(input$variety),
      CropGroup = safe_input(input$crop_group),
      C3C4 = safe_input(input$c3_c4),
      MonoDiCotyledon = safe_input(input$mono_di_cotyledon),
      InoculationMethod = safe_input(input$inoculation_method),
      ExperimentType = safe_input(input$experiment_type),
      Salinity = safe_input(input$salinity),
      Comments = safe_input(input$comments),
      stringsAsFactors = FALSE
    )
    
    # Collect results data and associate with the current study
    if (length(rv$results_list) > 0) {
      results_df <- do.call(rbind, rv$results_list)
      # Combine study-level data with each result
      combined_df <- cbind(current_study[rep(1, nrow(results_df)), ], results_df)
    } else {
      # If no results, just add the study-level data
      combined_df <- current_study
    }
    
    # Before updating, push the current data to the undo stack
    rv$undo_stack[[length(rv$undo_stack) + 1]] <- rv$all_data
    rv$redo_stack <- list()  # Clear the redo stack
    
    # Append to all_data
    if (is.null(rv$all_data)) {
      rv$all_data <- combined_df
    } else {
      # Ensure that the columns match
      if (all(names(rv$all_data) == names(combined_df))) {
        rv$all_data <- rbind(rv$all_data, combined_df)
      } else {
        # If columns don't match, align columns by name
        combined_df <- combined_df[, names(rv$all_data), drop = FALSE]
        rv$all_data <- rbind(rv$all_data, combined_df)
      }
    }
    
    # Update the data table
    output$all_data_table <- renderDataTable({
      if (!is.null(rv$all_data) && nrow(rv$all_data) > 0) {
        datatable(rv$all_data, editable = TRUE, options = list(pageLength = 10, autoWidth = TRUE))
      } else {
        datatable(data.frame(), options = list(dom = 't'))
      }
    }, server = FALSE)
    
    showNotification("Results submitted successfully.", type = "message")
  }
  
  # Observe the "Submit Entry" button
  observeEvent(input$submit_entry, {
    submit_data()
  })
  
  # Observe the "Submit Results" button
  observeEvent(input$submit_results, {
    submit_data()
  })
  
  # Toggle Data Section
  observeEvent(input$toggle_data, {
    rv$data_visible <- !rv$data_visible  # Toggle the visibility state
    shinyjs::toggle("data_section")      # Toggle the visibility of the data_section div
    
    # Update button label based on the new state
    if (rv$data_visible) {
      updateActionButton(session, "toggle_data", label = "Hide Data")
    } else {
      updateActionButton(session, "toggle_data", label = "Show Data")
    }
  })
  
  # Example Run: Populate the fields with example data
  observeEvent(input$example_run, {
    example_data <- list(
      paper_id = sample(1:1000, 1),
      title = paste("Example Study", sample(1:1000, 1)),
      abstract = "This is an example abstract.",
      doi = paste0("10.1234/example.doi.", sample(1:1000, 1)),
      year = sample(2000:2023, 1),
      submission_date = Sys.Date() - sample(100:200, 1),
      acceptance_date = Sys.Date() - sample(50:99, 1),
      publication_date = Sys.Date() - sample(1:49, 1),
      days_submission_publication = sample(1:200, 1),
      number_of_authors = sample(1:10, 1),
      first_author = "John Doe",
      first_author_id = "https://orcid.org/0000-0001-2345-6789",
      first_author_hindex = sample(10:50, 1),
      first_author_i10index = sample(5:40, 1),
      last_author = "Jane Smith",
      last_author_id = "https://orcid.org/0000-0002-3456-7890",
      last_author_hindex = sample(15:60, 1),
      last_author_i10index = sample(10:50, 1),
      corresponding_author = "Alice Johnson",
      corresponding_author_id = "https://orcid.org/0000-0003-4567-8901",
      corresponding_author_hindex = sample(20:70, 1),
      corresponding_author_i10index = sample(15:60, 1),
      corresponding_author_email = "alice@example.com",
      group_lab_name = "Example Lab",
      institute_name = "Example University",
      institute_country = "Example Country",
      journal_name = "Example Journal",
      impact_factor = runif(1, 1, 10),
      citation_score = sample(0:100, 1),
      publisher = "Example Publisher",
      cited_by = sample(0:500, 1),
      altmetric_score = sample(0:1000, 1),
      country_of_research = "Example Country",
      continent = "Example Continent",
      keywords = "Example, Test, Sample",
      access_type = sample(c("Open Access", "Subscription", "Other"), 1),
      funding_source = "Example Funding Agency",
      data_availability = "Data available upon request.",
      word_count = sample(3000:10000, 1),
      number_of_references = sample(20:100, 1),
      sdg_mention = sample(c("Yes", "No"), 1),
      sdg_no = "1, 2, 3",
      bacterial_genus = "ExampleGenus",
      bacterial_species = "ExampleSpecies",
      bacterial_strain = "ExampleStrain",
      gram_test = sample(c("Gram-positive", "Gram-negative", "Unknown"), 1),
      crop_name = "ExampleCrop",
      variety = "ExampleVariety",
      crop_group = sample(c("Cereals", "Pulses", "Vegetables", "Medicinal", "Orchards", "Other"), 1),
      c3_c4 = sample(c("C3", "C4", "Other"), 1),
      mono_di_cotyledon = sample(c("Monocotyledon", "Dicotyledon", "Other"), 1),
      inoculation_method = sample(c("Seed", "Seedling/Root", "Soil", "Foliar", "Other"), 1),
      experiment_type = sample(c("In-vitro", "Growth Chamber", "Greenhouse/Pot", "Field", "Other"), 1),
      salinity = runif(1, 0, 200),
      comments = "No additional comments."
    )
    
    # Update inputs
    for (id in names(example_data)) {
      value <- example_data[[id]]
      if (id %in% names(input)) {
        if (is.numeric(value)) {
          updateNumericInput(session, id, value = value)
        } else if (is.character(value)) {
          updateTextInput(session, id, value = value)
        } else if (inherits(value, "Date")) {
          updateDateInput(session, id, value = value)
        }
      }
    }
    
    # Add example results
    rv$results_list <- list()
    for (i in 1:sample(1:5, 1)) {
      result <- data.frame(
        ResponseVariable = paste("Response", i),
        Mean_Control_Uninoculated = runif(1, 5, 15),
        SD_Control_Uninoculated = runif(1, 0.1, 2),
        N_Control_Uninoculated = sample(5:20, 1),
        Mean_Treatment_Uninoculated = runif(1, 10, 20),
        SD_Treatment_Uninoculated = runif(1, 0.1, 2),
        N_Treatment_Uninoculated = sample(5:20, 1),
        Mean_Control_Inoculated = runif(1, 15, 25),
        SD_Control_Inoculated = runif(1, 0.1, 2),
        N_Control_Inoculated = sample(5:20, 1),
        Mean_Treatment_Inoculated = runif(1, 20, 30),
        SD_Treatment_Inoculated = runif(1, 0.1, 2),
        N_Treatment_Inoculated = sample(5:20, 1),
        stringsAsFactors = FALSE
      )
      rv$results_list[[length(rv$results_list) + 1]] <- result
    }
    
    # Update the results table
    output$results_table <- renderDT({
      if (length(rv$results_list) > 0) {
        datatable(do.call(rbind, rv$results_list), selection = "single", options = list(pageLength = 5, autoWidth = TRUE))
      } else {
        datatable(data.frame(), options = list(dom = 't'))
      }
    })
    
    showNotification("Example run completed with example data.", type = "message")
  })
  
  # Download handler for the Excel file
  output$downloadData <- downloadHandler(
    filename = function() {
      req(rv$file_name)
      rv$file_name
    },
    content = function(file) {
      # Write all data to Excel file
      if (!is.null(rv$all_data) && nrow(rv$all_data) > 0) {
        write_xlsx(rv$all_data, path = file)
      } else {
        showNotification("No data available to download.", type = "error")
      }
    }
  )
}

# Run the application
shinyApp(ui = ui, server = server)
