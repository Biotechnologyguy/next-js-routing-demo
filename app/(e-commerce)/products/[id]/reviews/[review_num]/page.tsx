
const ProductReview = ({params} : {
    params :{
        id: string,
        review_num: string
    }
}) => {
  return (
    <div>
      This is review #{params.review_num} for product #{params.id}
    </div>
  )
}

export default ProductReview
