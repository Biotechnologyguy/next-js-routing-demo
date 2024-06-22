import Link from "next/link";

export default function ProductDetails({ params }: any) {
  return (
    <main>
      Product Name = {params.id}
      <Link href="/cart">Add To Cart</Link>
    </main>
  );
}
