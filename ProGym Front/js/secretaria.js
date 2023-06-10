$(function() {
    registarEvento($("#email"), "keyup", validacaoEmailCallback);
    registarEvento($("#senha"), "keyup", validacaoSenhaCollback);
    registarEvento($("#login"), "submit", validarFormulario);
})

function registarEvento(elemento, nome, callback) {
    elemento[nome](callback);
}

function isvalidElement(element, valido) {
    return element.validity.valid && $(element).val() !== ''; 
}

function validacaoEmailCallback() {
    if(!isvalidElement(this))
        $("#email-status").text("Insira um email válido").addClass("status-message active");
    else
        $("#email-status").text(""); 
}

function validacaoSenhaCollback() {
    if(!isvalidElement(this))
        $("#senha-status").text("Insira uma senha válida").addClass("status-message active");
    else
        $("#senha-status").text("");
}

function validarFormulario() {
    if(isvalidElement($("#email")[0]) && isvalidElement($("#senha")[0]))
    {
        event.preventDefault();
        jQuery.ajax({
            type: "GET",
            url: this.action,
            data: $(this).serialize(),
            dataType: "json",
            success: function(data) {
                console.log(data)
            },
            error: function(e) {
                console.log(e)
            }
        })
    }
    
    event.preventDefault();
}