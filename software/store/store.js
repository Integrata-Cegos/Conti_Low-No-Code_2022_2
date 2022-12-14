function userInput(){
    let inputElement = document.getElementById("input")
    let resultElement = document.getElementById("result")
    let input = inputElement.value
    let itemCount = parseInt(input)
    if (itemCount > 0) {
        let totalPrice = calculatePrice(itemCount)
        resultElement.value = "Total price is " + totalPrice
    } else {
        resultElement.value = "invalid input"
    }
}

function calculatePrice(numberOfItems){
    let discounts = {
        no: 0,
        low: 0.05,
        high: 0.1
    }
    let discount = discounts.no
    if (numberOfItems >= 10 && numberOfItems < 20) {
        discount = discounts.low
    } else if (numberOfItems >= 20) {
        discount = discounts.high
    }
    let itemPrice = 42
    let totalPrice = itemPrice * numberOfItems * (1 - discount)
    return totalPrice

}
