jQuery.ketchup

.validation('required', 'Este campo é obrigatório.', function(form, el, value) {
  var type = el.attr('type').toLowerCase();
  
  if(type == 'checkbox' || type == 'radio') {
    return (el.attr('checked') == true);
  } else {
    return (value.length != 0);
  }
})

.validation('minlength', 'Campo deve possuir o mínimo de {arg1} caracteres.', function(form, el, value, min) {
  return (value.length >= +min);
})

.validation('maxlength', 'Campo deve possuir o máximo de {arg1} caracteres.', function(form, el, value, max) {
  return (value.length <= +max);
})

.validation('rangelength', 'Valores permitidos: Entre {arg1} e {arg2}.', function(form, el, value, min, max) {
  return (value.length >= min && value.length <= max);
})

.validation('min', 'Mínimo de {arg1}.', function(form, el, value, min) {
  return (this.isNumber(value) && +value >= +min);
})

.validation('max', 'Máximo de {arg1}.', function(form, el, value, max) {
  return (this.isNumber(value) && +value <= +max);
})

.validation('range', 'Deve estar entre {arg1} e {arg2}.', function(form, el, value, min, max) {
  return (this.isNumber(value) && +value >= +min && +value <= +max);
})

.validation('number', 'Deve ser um número.', function(form, el, value) {
  return this.isNumber(value);
})

.validation('digits', 'Deve conter apenas dígitos.', function(form, el, value) {
  return /^\d+$/.test(value);
})

.validation('email', 'E-mail inválido.', function(form, el, value) {
  return this.isEmail(value);
})

.validation('url', 'URL inválida.', function(form, el, value) {
  return this.isUrl(value);
})

.validation('username', 'Username inválido.', function(form, el, value) {
  return this.isUsername(value);
})

.validation('match', 'Valor permitido: {arg1}.', function(form, el, value, word) {
  return (el.val() == word);
})

.validation('contain', 'Deve conter o valor: {arg1}', function(form, el, value, word) {
  return this.contains(value, word);
})

.validation('date', 'Formato de data inválido.', function(form, el, value) {
  return this.isDate(value);
})

.validation('minselect', 'Select at least {arg1} checkboxes.', function(form, el, value, min) {
  return (min <= this.inputsWithName(form, el).filter(':checked').length);
}, function(form, el) {
  this.bindBrothers(form, el);
})

.validation('maxselect', 'Select not more than {arg1} checkboxes.', function(form, el, value, max) {
  return (max >= this.inputsWithName(form, el).filter(':checked').length);
}, function(form, el) {
  this.bindBrothers(form, el);
})

.validation('rangeselect', 'Select between {arg1} and {arg2} checkboxes.', function(form, el, value, min, max) {
  var checked = this.inputsWithName(form, el).filter(':checked').length;
  
  return (min <= checked && max >= checked);
}, function(form, el) {
  this.bindBrothers(form, el);
});