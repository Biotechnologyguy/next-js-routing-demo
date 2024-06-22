import Link from "next/link";

const Docs = () => {
  return (
    <div>
      <h1>Docs Home Page</h1>
      <Link href="/docs/getting-started">
        Getting Started
      </Link>
      <br />
      <Link href="/docs/getting-started/installation">
        installation
      </Link>
      <br />
      <Link href="/docs/api-reference">
        API Reference
      </Link>
    </div>
  );
};

export default Docs;
