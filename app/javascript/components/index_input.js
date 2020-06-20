const indexInput = () => {
  const letters = document.querySelectorAll('.letter');
  let counter = 1;

  letters.forEach((letter) => {

    letter.addEventListener('click', (event) => {
　　　　//Putting value to the form
      const inputForm = document.getElementById(counter);
      inputForm.value = letter.dataset.letterIndex;
      counter += 1;

      // changing text color
      //counterが奇数なら、その文字だけを変える。
      //counterが偶数なら、counter -1 のinput form のvalueのindex から、今回のvalueのindexまでの範囲の色を全て変える。
      if((counter - 1) % 2 !== 0) {
        letter.classList.add("red");
      } else {
        const lastInput = document.getElementById(counter -2);
        const elements = $(letters[parseInt(lastInput.value)]).nextUntil(event.currentTarget);

        elements.each(function(element) {
          this.classList.add('red');
        });
        letter.classList.add("red");
      }

    });

  });

  const resetBtn = document.querySelector('.btn');
  const inputs = document.querySelectorAll('.input_form');
  resetBtn.addEventListener('click', (event) => {
    letters.forEach((letter) => {
      letter.classList.remove('red');
    });

    inputs.forEach((input) => {
      input.value = "";
    });

    counter = 1;

  });



}

export { indexInput }
