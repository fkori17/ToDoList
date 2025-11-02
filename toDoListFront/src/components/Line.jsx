const Line = (props) => {
  return (
    <tr>
      <td>{props.id}</td>
      <td>{props.title}</td>
      <td>{props.description}</td>
      <td className={props.is_completed ? "green" : "red"}>
        {props.is_completed ? "Kész" : "Nincs kész"}
      </td>
      <td>{props.assigned_to}</td>
      <td>{props.created_at.split("T")[0]}</td>
      <td>{props.updated_at.split("T")[0]}</td>
    </tr>
  );
};

export default Line;
