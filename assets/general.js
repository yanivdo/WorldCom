

$(".searchSubmit").on("click", function (e) {
    e.preventDefault();
    $(".resultWrapper").html("");
    var select = $(".countrySelect").val();
    var array = select.split(",");
    var zipCode = $(".zipCodeSearch").val();
    var countryCode = array[1];
    var name = array[0];
    var err = 0;

    if (countryCode.length <= 0) {
        err++;
    }
    if (zipCode.length <= 0) {
        err++;
    }
    if (err == 0) {
        $.ajax({
            url: "places/searchPlace",
            type: "POST",
            data: {
                name: name,
                countryCode: countryCode,
                zipCode: zipCode
            },
        }).done(function (data) {
            $(".resultWrapper").append(data);
        });
    }
});