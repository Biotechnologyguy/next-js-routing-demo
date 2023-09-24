import Link from "next/link";

export default function Checkout() {
  const orderId = Math.floor(Math.random() * 1000);
  return (
    <main>
      <h1>Checkout Page</h1>
      <Link href={"order/" + orderId}>Confirm Order</Link>
    </main>
  );
}
