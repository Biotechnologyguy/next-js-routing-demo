import Link from "next/link"

export default function Home() {
  return (
    <main>
      <Link href="/projects/list">See Projects</Link>
      <Link href="/signin">Sign In</Link>
      <Link href="/signup">Sign Up</Link>
      <Link href={'/_escaped'}>Go to _escaped</Link>
      <h1>Home</h1>
    </main>
  )
}