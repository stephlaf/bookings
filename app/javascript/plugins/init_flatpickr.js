import flatpickr from "flatpickr";
// Regular css
// import 'flatpickr/dist/flatpickr.min.css';

// Using a theme
import 'flatpickr/dist/themes/airbnb.css';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

const dateStuff = () => {
  const unvailableDates = JSON.parse(document.getElementById('widget').dataset.unavailable)


  flatpickr('#start_date', {
    disable: unvailableDates,
    altInput: true,
    "plugins": [new rangePlugin({ input: '#end_date'})],
    enableTime: true
  });
};

export { dateStuff };
