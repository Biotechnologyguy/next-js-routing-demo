import Link from "next/link";

const NotFoundPage: React.FC = () => {
  return (
    <div
      style={{
        textAlign: "center",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        flexDirection: "column",
        height: "70vh",
      }}
    >
      <h1>404 - Page Not Found</h1>
      <p>Oops! The page you are looking for does not exist.</p>
      <Link href="/">Go back to home</Link>
    </div>
  );
};

export default NotFoundPage;
