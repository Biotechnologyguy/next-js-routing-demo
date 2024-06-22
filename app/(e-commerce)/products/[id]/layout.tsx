const Layout = ({ children }: { children: React.ReactNode }) => {
  return (
    <main>
      <h1>Product Details</h1>
      {children}
    </main>
  );
};

export default Layout;
