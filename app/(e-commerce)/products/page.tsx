import Link from "next/link";

export default function Products() {
  return (
    <main>
      <h1>Products Page</h1>
      <ul>
        <Link href="/products/laptop">
          <li>Laptop</li>
        </Link>
        <Link href="/products/mobile">
          <li>Mobile</li>
        </Link>
        <Link href="/products/television">
          <li>Television</li>
        </Link>
      </ul>
    </main>
  );
}
