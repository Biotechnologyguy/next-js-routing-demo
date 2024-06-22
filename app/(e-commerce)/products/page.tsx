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

      <h1>Reviews</h1>
      <ul>
        <Link href="/products/1/reviews/1">
          <li>Review 1</li>
        </Link>
        <Link href="/products/1/reviews/2">
          <li>Review 2</li>
        </Link>
        <Link href="/products/1/reviews/3">
          <li>Review 3</li>
        </Link>
      </ul>
    </main>
  );
}
