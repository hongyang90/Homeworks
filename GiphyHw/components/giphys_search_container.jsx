import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';

const mapStateToProps = (state) => {
    return {
        giphys: state.giphys};
}

const mapDispatchToProps = (dispatch) => ({
    fetchSearchGiphys: (term) => {dispatch(fetchSearchGiphys(term))}
});

export default connect(mapStateToProps, mapDispatchToProps)(GiphysSearch);