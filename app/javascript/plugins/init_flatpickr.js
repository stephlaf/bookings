import flatpickr from "flatpickr";
// Regular css
// import 'flatpickr/dist/flatpickr.min.css';

// Using a theme
import 'flatpickr/dist/themes/airbnb.css';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

const dateStuff = () => {
  const widget = document.getElementById('widget');
  
  if (widget) {
    const unvailableDates = JSON.parse(widget.dataset.unavailable)

    const fp = flatpickr('#start_date', {
      disable: unvailableDates,
      minDate: 'today',
      altInput: true,
      "plugins": [new rangePlugin({ input: '#end_date'})]
      // enableTime: true
    });

    console.log(fp.selectedDates);
  }
};

export { dateStuff };
