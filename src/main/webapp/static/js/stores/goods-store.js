var page = 0;
const getPage = ()=> {
    return page;
}
const incrementPage = () => {
    page++;
}
export function useGoodStore() {
    return {
        getPage,
        incrementPage
    }
}