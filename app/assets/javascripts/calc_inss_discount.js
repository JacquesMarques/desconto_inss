function calcInssDiscount(element) {
  $.ajax({
    url: '/proponent/inss_discount',
    data: { salary: element.value }
  }).done((data) => {
    $("#proponent_inss_discount").val(data.discount)
  }).fail(()=> {
    alert("Erro ao calcular o desconto INSS.")
  });
}