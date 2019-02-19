import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

const addLoggingToDispatch = (store) => {
  return function(next) {
    return function(action) {
      return function (action) {
        console.log(store.getState());
        console.log(action);
        dispatch(action);
        console.log(store.getState());
        return next(action);
      };
      
    };
  };
};

const applyMiddleware = (store, middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach( middle => {
    dispatch = middle(store, dispatch);
  });
  Object.assign({}, store, { dispatch });
}

//phase 1
// const addLoggingToDispatch = (store) => {

//   let dispatch = store.dispatch;
//   return function (action) {
//     console.log(store.getState());
//     console.log(action);
//     dispatch(action);
//     console.log(store.getState());

//   };

// };


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  //phase 1
  // store.dispatch = addLoggingToDispatch(store);
  store = applyMiddleware(store, addLoggingToDispatch)
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
