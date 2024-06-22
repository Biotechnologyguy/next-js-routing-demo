const Layout = ({ children }: { children: React.ReactNode }) => {
  return (
    <main>
      <div
        style={{
          padding: "20px",
          backgroundColor: "grey",
          color: "white",
          marginBottom: "20px",
          width: "100%",
          textAlign: "center",
        }}
      >
        <h1>Product Details</h1>
      </div>
      {children}
    </main>
  );
};

export default Layout;
