import { combineReducers } from 'redux';

import {giphyReducer} from './giphys_reducer';

export const rootReducer = combineReducers({
    giphys: giphyReducer
});
