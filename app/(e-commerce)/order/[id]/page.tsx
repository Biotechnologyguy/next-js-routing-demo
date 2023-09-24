export default function OrderDetails({ params }: any) {
  return (
    <main>
      <h1>Your order with order id {params.id} is successfully placed</h1>
    </main>
  );
}
