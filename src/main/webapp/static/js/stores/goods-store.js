var page = 0

const getPage = ()=> {
    return page;
}
const incrementPage = () => {
    page++;
}
export function useGoodsStore() {
    return {
        getPage,
        incrementPage
    }
}