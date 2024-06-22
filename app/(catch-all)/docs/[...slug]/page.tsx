
const FeaturePage = ({params} : {
    params: {
        slug: string[]
    }
}) => {
  return (
    <h1>
      Documentation for {params.slug.join(' -> ')}
    </h1>
  )
}

export default FeaturePage
