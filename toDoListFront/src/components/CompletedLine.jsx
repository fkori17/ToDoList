const CompletedLine = (props) => {
  return (
    <tr>
      <td>{props.id}</td>
      <td>{props.title}</td>
      <td>{props.description}</td>
      <td>{props.assigned_to}</td>
      <td>{props.created_at.split("T")[0]}</td>
    </tr>
  );
};

export default CompletedLine;
