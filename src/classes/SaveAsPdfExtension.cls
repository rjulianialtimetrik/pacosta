public class SaveAsPdfExtension {

    // Required extension constructor (empty, no-op)
    public SaveAsPDFExtension(ExpenseController controller) {}
    
    // Determines what kind of rendering to use for the page request
    public String renderingService { get; private set; }

    // Action method to save (or "print") to PDF
    public PageReference saveToPdf() {
        renderingService = 'PDF';
        return null;
    }
    
    
    
}