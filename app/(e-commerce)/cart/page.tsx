import Link from "next/link";

export default function Cart() {
  return (
    <main>
      <h1>Cart</h1>
      <ul>
        <li>TV</li>
        <li>Laptop</li>
        <li>Mobile</li>
        <li>Kohinoor</li>
        <Link href="/checkout">Checkout</Link>
      </ul>
    </main>
  );
}
