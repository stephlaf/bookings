import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';
import flatpickr from "flatpickr";

// Regular css
// import 'flatpickr/dist/flatpickr.min.css';

// Using a theme
import 'flatpickr/dist/themes/airbnb.css';

const getDatesAndPrice = (fp) => {
  const calcPrice = document.getElementById('calc-price');
  const priceElement = document.getElementById('price');
  const price = Number.parseInt(priceElement.innerText, 10);

  const startDate = document.getElementById('start_date');
  
  startDate.addEventListener('input', () => {
    const dates = fp.selectedDates;
    if (dates[1]) {
      const days = ((dates[1] - dates[0]) / (24 * 60 * 60 *1000));
      calcPrice.innerText = price * days;
    }
  });
};

const flatPickCalendar = () => {
  const widget = document.getElementById('widget');
  
  if (widget) {
    const unvailableDates = JSON.parse(widget.dataset.unavailable)

    const fp = flatpickr('#start_date', {
      disable: unvailableDates,
      minDate: 'today',
      altInput: true,
      "plugins": [new rangePlugin({ input: '#end_date' })]
    });

    getDatesAndPrice(fp);
  }
};

export { flatPickCalendar };
