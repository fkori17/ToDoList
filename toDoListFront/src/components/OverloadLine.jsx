const OverloadLine = (props) => {
  return (
    <tr>
      <td>{props.assigned_to}</td>
      <td>{props.task_count}</td>
    </tr>
  );
};

export default OverloadLine;
