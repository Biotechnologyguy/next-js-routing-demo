import Link from "next/link";

export default function ProjectList() {
  return (
    <main>
       <h1>Projects</h1>
       <Link href="/projects/jobit">JobIt</Link>
       <Link href="/projects/carrent">CarRent</Link>
       <Link href="/projects/hipnode">HipNode</Link>
    </main>
  )
}
