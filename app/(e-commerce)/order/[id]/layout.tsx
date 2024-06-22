const OrderLayout = ({ children }: { children: React.ReactNode }) => {
  return (
    <div
      style={{
        textAlign: "center",
      }}
    >
      <h1>Order Details</h1>
      {children}
    </div>
  );
};

export default OrderLayout;
