let goodsItemList;

const setGoodsItemList = (list) => {
    goodsItemList = list
}

const getGoodsItemList = () => {
    return goodsItemList
}

export function useGoodsStore() {
    return {
        setGoodsItemList,
        getGoodsItemList
    }
}